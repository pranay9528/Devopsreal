#!/bin/bash
IMAGE_NAME=myapp
USERNAME=pranay9528
echo "Bulding image.."
docker build -t $IMAGE_NAME .
echo "tagging image.."
docker tag $IMAGE_NAME $USERNAME/$IMAGE_NAME:latest
echo "pushing image ...."
docker push $USERNAME/$IMAGE_NAME:latest
echo "deployment completed"
