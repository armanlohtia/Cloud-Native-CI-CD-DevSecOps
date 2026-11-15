# Week 5 — Terraform, AWS & Ansible

## Objective

Provision AWS infrastructure using Terraform and configure an EC2 instance using Ansible.

The final setup deploys the Cloud Native Task API as a Docker container on AWS EC2.

## Architecture

GitHub
    |
    v
Terraform
    |
    v
AWS VPC
    |
    +-- Public Subnet
    |
    +-- Internet Gateway
    |
    +-- Route Table
    |
    +-- Security Group
    |
    v
EC2 t3.micro
    |
    v
Ansible
    |
    +-- Install Docker
    +-- Configure Docker
    +-- Deploy application
    |
    v
Docker Container
    |
    v
FastAPI Task API :8000

## Terraform

Terraform provisions:

- AWS VPC
- Public subnet
- Internet Gateway
- Public route table
- Security group
- Ubuntu EC2 instance
- Public IP

Region:

`ap-south-1`

Instance type:

`t3.micro`

## Ansible

Ansible connects to the EC2 instance through SSH.

The configuration playbook:

- Updates apt packages
- Installs Docker
- Enables Docker service
- Adds the ubuntu user to the docker group
- Verifies Docker installation

The deployment playbook:

- Pulls the application image from Docker Hub
- Removes an existing container
- Starts the FastAPI container
- Waits for the application
- Verifies the `/health` endpoint

## Docker

Docker image:

`armanlohtia/cloud-native-task-api:1.0`

The image is hosted on Docker Hub and pulled directly by the EC2 instance.

## Verification

Terraform:

```bash
terraform plan

Result:
No changes. Your infrastructure matches the configuration.

Ansible:

ansible app -i inventory.ini -m ping

Result:
ping: pong

Docker:

ansible app -i inventory.ini -m shell -a "docker ps" -b

Application health:

curl http://<EC2_PUBLIC_IP>:8000/health

## Week 6 — Day 1: Security Hardening

The Week 5 Terraform configuration was reviewed and hardened as part of Week 6.

### Security improvements

- Removed unnecessary public HTTP port 80 access.
- Made SSH access configurable through `ssh_allowed_cidr`.
- Made Task API access configurable through `api_allowed_cidr`.
- Defaulted SSH and API access to `127.0.0.1/32` instead of exposing them to the internet.
- Avoided hardcoding external IP addresses in the Terraform configuration.
- Applied the principle of least privilege to inbound network access.
- Kept Terraform state and plan files excluded from Git.

### Validation

The Terraform configuration was formatted and validated locally using:

```bash
terraform fmt
terraform validate
git diff --check
