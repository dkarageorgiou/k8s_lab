#!/bin/bash

IMAGE_NAME = "ansible_terraform"

mkdir tmp

# Build docker image
docker build -t ${IMAGE_NAME} .

# Generate ssh keypair
docker run \
    --rm -it \
    -v $(pwd):/data \
    ${IMAGE_NAME} \
    ssh-keygen -f /data/tmp/mykey