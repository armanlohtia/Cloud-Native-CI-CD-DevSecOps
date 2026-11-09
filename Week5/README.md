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




