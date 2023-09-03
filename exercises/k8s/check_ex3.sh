#!/bin/bash

# Build a Docker image from the submitted Dockerfile
docker build -t local-my-server .

# Tag and push it to the local registry
docker tag local-my-server registry:5000/my-server
docker push registry:5000/my-server

# Remove local version, so that the registry will be used for sure
docker image remove local-my-server
docker image remove registry:5000/my-server

# Load kicbase image into docker
docker load -i /mk/kicbase-image

# Remove any existing minikube configs
minikube delete --all --purge

# Copy the minikube cache files from /mk folder into the correct minikube cache dir
cp -r /mk/.minikube ~/

# Start minikube
minikube start --kubernetes-version=v1.25.3 --insecure-registry="registry:5000"

# Add registry to /etc/hosts on the minikube "machine" as otherwise minikube will not find it
REGISTRY_IP=$(host -t A registry | grep -oE '([0-9]{1,3}\.){3}[0-9]{1,3}')
minikube ssh "echo $REGISTRY_IP registry | sudo tee -a /etc/hosts"

# Uncomment, if you need to debug in the container
# echo "started" >> minikube_started.txt
# sleep 360000

# Create a kubernetes deployment from the submission
minikube kubectl -- create -f /submission/user/k8sConfig.yaml
/exercise/deployment_ready_check.sh my-server-deployment

# Forward kubernetes container's port to a local port
coproc minikube kubectl -- port-forward deployment/my-server-deployment 30021:4500

# Wait a few seconds for the port forwarding to start
sleep 2

# Save the HTTP-response to a file
curl -s -i http://localhost:30021 > http_response.txt

# grep -c tells how many times the searched string is found from the input data
CONN_OK=$(cat http_response.txt | grep -c "200 OK")
CORRECT_RESPONSE=$(cat http_response.txt | grep -c "Abrakadabra")

# Final points are scaled to 0-10 and we just check that CONN_OK is greater than 0, 
# to give the max points, so that going over the maximum would not be possible.
# by cheating the system somehow.
PTS=$((($CONN_OK > 0)*5 + ($CORRECT_RESPONSE > 0)*5))

# Print points in the format that A+ accepts
echo TotalPoints: $PTS
echo MaxPoints: 10
