#!/bin/bash

/exercise/build-submitted-dockerfile.sh local-my-server my-server

/exercise/setup_minikube.sh

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

# Final points are scaled to 0-10 and we just check that CONN_OK and CORRECT_RESPONSE
# are greater than 0, to give the max points, so that going over the maximum would not 
# be possible by cheating the system somehow.
PTS=$((($CONN_OK > 0)*5 + ($CORRECT_RESPONSE > 0)*5))

# Print points in the format that A+ accepts
echo TotalPoints: $PTS
echo MaxPoints: 10
