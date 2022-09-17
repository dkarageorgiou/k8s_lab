# K8s Lab

## Scope

Builds a kubernetes cluster that consist of 1 master node and 2 workers in AWS, using an ubuntu image as t2.medium (expect a cost of ~EUR 3 / 24 hours of usage)

## Requirements

- Docker desktop
- AWS account and an Access / Secret key (See https://docs.aws.amazon.com/powershell/latest/userguide/pstools-appendix-sign-up.html)

## Usage

Add your AWS credentials under Terraform/terraform.tfvars

- Create the stack
> ./entrypoint deploy

- Destroy the stack
> ./entrypoint destroy

- Login to master node
> ssh -i tmp/mykey ubuntu@master_ip_address

- Switch to user kube
> sudo su - kube
