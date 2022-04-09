#!/usr/bin/env bash

set -e

# enable docker-buildkit
export DOCKER_BUILDKIT=1

# check for missing input
if [[ "$USERNAME" == "" ]]; then
    echo "No username defined!"
    echo "exiting..."
    exit 1
elif [[ "$PASSWORD" == "" ]]; then
    echo "No password defined!"
    echo "exiting..."
    exit 1
elif [[ "$REPOSITORY" == "dockerhub" || "$REPOSITORY" == "DockerHub" || "$REPOSITORY" == "Dockerhub" ]]; then
    echo "Dockerhub login detected! switching to dockerhub registry..."
    export REPOSITORY=TEST
    echo "done!"
    echo "Sorry, this is not implemented yet exiting therefore..."; exit
elif [[ "$REPOSITORY" == "" ]]; then
    echo "No repository defined!"
    echo "exiting..."
    exit 1
fi

echo ""
echo "================="
echo "building image..."
echo "================="
echo ""
# don't use cached layers and always pull never base images
docker build . \
    --tag $REPOSITORY \
    --no-cache \
    --pull

echo ""
echo "=================================================="
echo "Performing auto login into your docker registry..."
echo "=================================================="
echo ""
echo $PASSWORD | docker login \
    --username $USERNAME \
    --password-stdin \
    docker-push.nexus.local.leven.dev

echo ""
echo "====================================="
echo "Pushing the image to your registry..."
echo "====================================="
echo ""
docker push $REPOSITORY

echo ""
echo "========="
echo "FINISHED!"
echo "========="
echo ""
