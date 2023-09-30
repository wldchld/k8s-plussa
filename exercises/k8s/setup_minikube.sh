#!/bin/bash

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