# K8s Lab

## Scope

Builds a kubernetes cluster that consist of 1 master node and 2 workers in AWS

## Requirements

- Docker desktop
- AWS account and an API / Secret key (See https://docs.aws.amazon.com/powershell/latest/userguide/pstools-appendix-sign-up.html)

## Usage

Add your AWS credentials under Terraform/terraform.tfvars

- Create the stack
> ./entrypoint deploy

- Destroy the stack
> ./entrypoint destroy
