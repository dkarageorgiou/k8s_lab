#!/bin/bash

docker run \
    --rm -it -v $(pwd):/data \
    -e ANSIBLE_CONFIG=Ansible/ansible.cfg \
    ansible_terraform \
    ansible-playbook \
    Ansible/workflow.yml ${1}