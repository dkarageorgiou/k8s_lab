#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

destroy(){

    rm -rf tmp/*
    rm -rf Terraform/.terraform
    rm -rf Terraform/.terraform.lock.hcl
    rm -rf Terraform/.terraform.tfstate
    rm -rf Terraform/.terraform.tfstate.backup
    
}

create(){

    DOCKER="docker run --rm -it -v $(pwd):/data ansible_terraform"

    ${DOCKER} mkdir -p tmp
    ${DOCKER} ssh-keygen -f /data/tmp/mykey -t rsa -N ''

    cd Terraform
    DOCKER="docker run --rm -it -v $(pwd):/data ansible_terraform"

    ${DOCKER} terraform init
    ${DOCKER} terraform plan
    ${DOCKER} terraform apply -auto-approve

    cd -
    cd Ansible
    DOCKER="docker run --rm -it -v $(pwd):/data ansible_terraform"


    ${DOCKER} ansible-playbook users.yml
    ${DOCKER} ansible-playbook install_k8s.yml
    ${DOCKER} ansible-playbook master.yml
    ${DOCKER} ansible-playbook join-workers.yml

    cd -

}

if [ ${1} == 'create' ]
then
    create
elif [ ${1} == 'destroy' ]
then
    destroy
fi
