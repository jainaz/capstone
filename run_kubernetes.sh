#!/usr/bin/env bash

# Create dockerpath
image=my-ml-app
dockerpath=anksjain/$image

# Run in Docker Hub container with kubernetes
kubectl run my-ml-app\
    --image=$dockerpath\
    --port=80 --labels app=my-ml-app

# List kubernetes pods
kubectl get pods

# Forward the container port to host
sudo kubectl port-forward my-ml-app 80:80