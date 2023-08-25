#!/bin/bash
IMAGE_NAME="hello-world"
IMAGE_TAG="2.0"
CONTAINER_PORT=80
HOST_PORT=81
docker stop hello-world-container
docker rm hello-world-container
docker run -d --name hello-world-container -p $HOST_PORT:$CONTAINER_PORT $IMAGE_NAME:$IMAGE_TAG
