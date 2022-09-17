#!/bin/bash

if [ ${1} == 'deploy' ]
then
    if test -f "tmp/cluster_initialized"; then

        echo "Cluster already initialized!"
    
    else
        docker run \
                --rm -it -v $(pwd):/data \
                -e ANSIBLE_CONFIG=Ansible/ansible.cfg \
                dkar13/ansible_terraform \
                /bin/bash -c \
                "ansible-playbook Ansible/infra.yml \
                && ansible-playbook Ansible/workflow.yml \
                && touch tmp/cluster_initialized \
                && terraform -chdir=Terraform/ output master_ec2_public_ip \
                && echo 'SSH to kube master with: ssh -i tmp/mykey ubuntu@master_ip_address'"
    fi

elif [ ${1} == 'destroy' ]
then
    docker run \
            --rm -it -v $(pwd):/data \
            dkar13/ansible_terraform \
            /bin/bash -c \
            "terraform -chdir=Terraform/ destroy -auto-approve && rm -rf tmp/"
fi