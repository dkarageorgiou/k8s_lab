#!/bin/bash

DOCKER = "docker run --rm -it -v $(pwd):/data ansible_terraform"

# Create tmp dir
${DOCKER} \
    mkdir tmp

# Generate ssh keypair
${DOCKER} \
    ssh-keygen -f /data/tmp/mykey

# Initialize terraform
${DOCKER} \
    terraform init