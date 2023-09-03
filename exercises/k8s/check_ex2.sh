#!/bin/bash

# Load kicbase image into docker
docker load -i /mk/kicbase-image

# Remove any existing minikube configs
minikube delete --all --purge

# Copy the minikube cache files from /mk folder into the correct minikube cache dir
cp -r /mk/.minikube ~/

# Start minikube
minikube start --kubernetes-version=v1.25.3 --insecure-registry="registry:5000"

# Create a directory to the minikube machine that will be used as a local PersistentVolume
minikube ssh 'sudo mkdir /mnt/data'
# Copy the submitted HTML page to that directory 
# (use unix timestamp as the filename, so one cannot cheat with a ready-made image)
HTML_FILENAME="$(date +%s).html"
minikube cp index.html /mnt/data/$HTML_FILENAME

# Create a kubernetes deployment from the submission
minikube kubectl -- create -f /submission/user/submission.yaml
/exercise/deployment_ready_check.sh nginx-deployment

# Forward kubernetes container's port to a local port
coproc minikube kubectl -- port-forward deployment/nginx-deployment 30021:80

# Wait a few seconds for the port forwarding to start
sleep 2

# Save the HTTP-response to a file
curl -s -i http://localhost:30021/$HTML_FILENAME > http_response.txt

# grep -c tells how many times the searched string is found from the input data
CONN_OK=$(cat http_response.txt | grep -c "200 OK")
CORRECT_RESPONSE=$(cat http_response.txt | grep -c "Persistence!")

# Final points are scaled to 0-10 and we just check that CONN_OK is greater than 0, 
# to give the max points, so that going over the maximum would not be possible.
# by cheating the system somehow.
PTS=$((($CONN_OK > 0)*5 + ($CORRECT_RESPONSE > 0)*5))

# Print points in the format that A+ accepts
echo TotalPoints: $PTS
echo MaxPoints: 10
