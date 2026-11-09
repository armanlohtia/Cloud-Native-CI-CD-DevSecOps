# Ansible Configuration

## Inventory

`inventory.ini` defines the AWS EC2 host and SSH configuration.

## Playbook

`playbook.yml` configures the EC2 server.

It installs and enables Docker and verifies the installation.

## Application Deployment

`deploy-app.yml` deploys the Cloud Native Task API.

The playbook pulls:

```text
armanlohtia/cloud-native-task-api:1.0
