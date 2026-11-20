# Day 1 — Project Review and Repository Setup

## Objective
Review the existing projects, keep the repository organized, and make setup instructions reproducible.

## Repository areas identified
- `Week2/cloud-native-task-api`: Python API, tests, Dockerfile and requirements
- `Week3/helm/task-api`: Helm chart for the API
- `Week3/manifests`: standalone Kubernetes manifests and Secret examples
- `Week4/argocd`: Argo CD Application definition
- `Week4/prometheus` and `Week4/grafana`: monitoring material
- `Week5/terraform` and `Week5/ansible`: infrastructure automation

## Review record
The repository structure was inspected on 2026-11-20. A `Week6/` directory and topic subdirectories already existed but contained no files in the supplied listing.

## Completion checklist
- [ ] Review every project README and setup command.
- [ ] Confirm commands work from a clean clone, not only from a machine with local caches.
- [ ] Remove generated environments/caches from version control.
- [ ] Confirm `.gitignore` covers Python environments, caches, Terraform state/plans, and local secrets.
- [ ] Confirm all required files are committed and no local-only files are required.
- [ ] Add a clean repository tree to the final evidence.

## Setup instructions to finalize
**Prerequisites:** [FILL IN Python version], Docker, kubectl, Helm, Argo CD CLI/UI if used, Terraform version, Ansible version, and access to the required Kubernetes/cloud environment.

**Application setup:** See `Week2/cloud-native-task-api/README.md`.

**Kubernetes/Helm setup:** See `Week3/README.md` and `Week3/helm/task-api`.

**Monitoring setup:** See `Week4/README.md`.

**Infrastructure setup:** See `Week5/README.md`.

## Outcome
Repository areas have been identified. Mark this day complete only after the checklist above has been verified and setup instructions have been tested from a clean environment.
