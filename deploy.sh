#!/bin/bash

PROVIDER=$1

if [ "$PROVIDER" == "aws" ]; then
    echo "Deploying to AWS ECS..."
    aws ecs update-service \
        --cluster your-cluster \
        --service your-service \
        --force-new-deployment
elif [ "$PROVIDER" == "azure" ]; then
    echo "Deploying to Azure..."
    az webapp create \
        --resource-group your-group \
        --plan your-plan \
        --name your-app-name \
        --deployment-container-image-name your-dockerhub-username/nodejs-service:latest
else
    echo "Unknown provider: $PROVIDER"
    exit 1
fi
