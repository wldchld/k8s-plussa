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

# Check the replica count and how many of them are in the "Running" state.
REPLICA_COUNT=$(minikube kubectl -- get pods -l=app=my-server-app --no-headers | wc -l)
RUNNING_COUNT=$(minikube kubectl -- get pods -l=app=my-server-app --no-headers | grep -c "Running")

# Call the quit endpoint
curl -s -i http://localhost:30021/quit > /dev/null

# Wait for 10s and in that time Kubernetes should have restarted the pod that "died".
sleep 10
RESTART_COUNT=$(minikube kubectl -- get pods -l app=my-server-app --no-headers=true | awk '{s+=$4} END {print s}')

echo "REPLICA_COUNT=$REPLICA_COUNT (expected = 3)"
echo "RUNNING_COUNT=$RUNNING_COUNT (expected = 3)"
echo "RESTART_COUNT=$RESTART_COUNT (expected = 1)"

# Final points are scaled to 0-15. Student gets 5 points for having the correct number
# or replicas, another 5 points if they all have started and final 5 points
# if there has been exactly one restart, which we initiated in this checking script.
PTS=$((($REPLICA_COUNT == 3)*5 + ($RUNNING_COUNT == 3)*5 + ($RESTART_COUNT == 1)*5))

# Print points in the format that A+ accepts
echo TotalPoints: $PTS
echo MaxPoints: 15
