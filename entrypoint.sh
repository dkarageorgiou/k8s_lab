#!/bin/bash

#docker run \
#    --rm -it -v $(pwd):/data \
#    -e ANSIBLE_CONFIG=Ansible/ansible.cfg \
#    ansible_terraform \
#    ansible-playbook \
#    Ansible/workflow.yml --tags "${1}"

if [ ${1} == 'deploy' ]
then
    docker run \
        --rm -it -v $(pwd):/data \
        -e ANSIBLE_CONFIG=Ansible/ansible.cfg \
        ansible_terraform \
        /bin/bash -c \
        "ansible-playbook Ansible/infra.yml && ansible-playbook Ansible/workflow.yml"

elif [ ${1} == 'destroy' ]
    docker run \
        --rm -it -v $(pwd):/data \
        ansible_terraform \
        /bin/bash -c \
        "terraform -chdir=Terraform/ destroy -auto-approve && rm -rf tmp/"
fi