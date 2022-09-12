FROM ubuntu:20.04

ENV ANSIBLE_VERSION 2.10.6
ENV TERRAFORM_VERSION 1.2.8

WORKDIR /data

RUN set -ex \
    && apt-get update -y \
    && apt install python3-pip -y \
    && apt install openssh-client -y \
    && apt install unzip -y \
    && apt install wget -y \
    && pip3 install botocore boto boto3 \
    && pip3 install ansible==$ANSIBLE_VERSION


RUN set -ex \
    && wget https://releases.hashicorp.com/terraform/$TERRAFORM_VERSION/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && mv terraform /usr/local/bin/

CMD ["ansible-playbook", "--version"]