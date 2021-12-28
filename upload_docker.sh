#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
image=my-app
dockerpath=524381496777.dkr.ecr.us-east-1.amazonaws.com/capstone

# Step 2:  
# Authenticate & tag
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 524381496777.dkr.ecr.us-east-1.amazonaws.com

echo "Docker ID and Image: $dockerpath"
docker tag $image:latest $dockerpath:latest

# Step 3:
# Push image to a docker repository
echo "pushing to: $dockerpath:latest"
docker push $dockerpath:latest
