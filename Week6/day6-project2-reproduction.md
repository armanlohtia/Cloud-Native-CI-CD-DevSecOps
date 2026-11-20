# Day 6 — Project 2 Reproduction and Infrastructure Cleanup

## Objective
Reproduce Project 2 using only the repository documentation, verify Terraform and Ansible, and clean up cloud resources created for the exercise.

## Repository paths identified
- `Week5/terraform`
- `Week5/ansible`

The repository listing showed Terraform configuration files (`main.tf`, `provider.tf`, `variables.tf`, `outputs.tf`) and Ansible playbooks/inventory. The actual provider, resource inventory, target host, and cloud account were not established by the listing alone.

## Reproduction checklist
- [ ] Read `Week5/README.md`.
- [ ] Read `Week5/terraform/README.md` if present; otherwise create accurate setup documentation.
- [ ] Read `Week5/ansible/README.md`.
- [ ] Confirm required Terraform and Ansible versions.
- [ ] Confirm provider credentials are supplied securely through environment variables or a secret manager.
- [ ] Initialize Terraform.
- [ ] Review `terraform plan` before applying.
- [ ] Apply only in the intended sandbox/account.
- [ ] Verify Terraform outputs and actual infrastructure.
- [ ] Run the Ansible playbook against the intended inventory.
- [ ] Verify the deployed service.
- [ ] Record resource IDs and ownership before cleanup.
- [ ] Run `terraform destroy` only after confirming the exact workspace, account, region, and resources belong to this exercise.
- [ ] Verify no billable resources remain.

## Critical state-file warning
The repository listing showed `terraform.tfstate`, `terraform.tfstate.backup`, and `tfplan`. State and plan files may contain sensitive values. Do not commit them. Preserve any state needed to manage or destroy real resources in a secure location before deleting local copies. Do not destroy infrastructure until ownership and impact are confirmed.

## Reproduction record
- Provider/account: [FILL IN — do not include credentials]
- Region: [FILL IN]
- Terraform version: [FILL IN]
- Ansible version: [FILL IN]
- Resources created: [FILL IN]
- Ansible target: [FILL IN]
- Verification: [FILL IN]
- Cleanup performed: [YES/NO — attach evidence]
- Remaining resources/cost exposure: [FILL IN]

## Status
Pending verification from the actual Project 2 documentation and cloud environment. Do not claim reproduction or cleanup complete until evidence is attached.
