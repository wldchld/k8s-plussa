#!/bin/bash

DEPLOYMENT_NAME=$1
TOTAL_WAIT=0
SLEEP_INTERVAL=5
TIMEOUT=120

while [ $TOTAL_WAIT -lt $TIMEOUT ]; do
    STATUS=$(minikube kubectl -- get deployment $DEPLOYMENT_NAME -o jsonpath='{.status.conditions[?(@.type=="Available")].status}')

    if [ "$STATUS" == "True" ]; then
        echo "Deployment $DEPLOYMENT_NAME is now available!"
        exit 0
    fi

    echo "Waiting for $DEPLOYMENT_NAME to become available..."
    sleep $SLEEP_INTERVAL
    TOTAL_WAIT=$((TOTAL_WAIT + SLEEP_INTERVAL))
done

echo "Timeout! Deployment $DEPLOYMENT_NAME did not become available within $TIMEOUT s."
exit 1