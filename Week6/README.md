# Week 6 — Integration, Security and Final Submission

This folder consolidates the Week 6 roadmap, implementation notes, verification records, evidence index, and final handover material for `ICP-427D20C3-2026-REPO`.

> **Accuracy note:** This documentation distinguishes repository/configuration evidence from tests that still need to be executed. Do not mark a check complete until its command output, GitHub Actions run, screenshot, or other evidence has been added.

## Roadmap and status

| Day | Roadmap topic | Current documentation status |
|---|---|---|
| 1 | Review projects, clean repository structure, verify setup instructions | Repository structure inspected; cleanup/setup verification needs recording |
| 2 | Integrate CI: tests, image build, security scanning; publish image if configured | Workflow inspected; tests, Ruff, Bandit, Docker build and Trivy scan are configured. Image publishing is not present in the supplied workflow |
| 3 | Validate Helm/Argo CD deployment and monitoring | Argo CD `task-api` was observed `Synced` and `Healthy`; 3/3 pods and deployment were observed healthy. Monitoring directories exist; live monitoring validation needs evidence |
| 4 | Review secrets, image vulnerabilities, least privilege, network exposure and dependencies | Review checklist provided; complete the checks and attach evidence |
| 5 | Test failure recovery | Test plan provided; failure scenarios are intentionally marked pending until executed |
| 6 | Reproduce Project 2 from documentation; verify Terraform/Ansible and clean up cloud resources | Reproduction record/template provided; fill in actual Project 2 details and cleanup evidence |
| 7 | Complete README, architecture, evidence, demo and retrospective | Submission templates provided; finish evidence and retrospective before final hand-in |

## Repository context observed

- Application source: `Week2/cloud-native-task-api`
- Kubernetes/Helm: `Week3/helm/task-api` and `Week3/manifests`
- Argo CD: `Week4/argocd`
- Monitoring documentation/configuration: `Week4/prometheus` and `Week4/grafana`
- Terraform and Ansible: `Week5/terraform` and `Week5/ansible`
- GitHub Actions workflow: `.github/workflows/ci.yml`

The inspected CI workflow runs Python tests, Ruff, Bandit, builds a Docker image, and scans it with Trivy. The workflow output supplied for review did not contain a registry login or image-push step, so image publishing is not claimed as implemented.

## Contents

- `day1-repository-review.md` through `day7-final-submission.md`: daily roadmap records
- `architecture.md`: system flow and component responsibilities
- `final-report.md`: concise project hand-in report
- `submission-checklist.md`: pre-submission checklist
- `retrospective.md`: lessons-learned template
- `ci-cd/`, `security/`, `failure-recovery/`, `project2-reproduction/`: focused records and checklists
- `evidence/README.md`: evidence naming and capture guide

## Before pushing to GitHub — security gate

The repository listing showed potentially sensitive or generated files:
- `Week3/manifests/secret.yml`
- `Week5/terraform/terraform.tfstate`
- `Week5/terraform/terraform.tfstate.backup`
- `Week5/terraform/tfplan`
- Python virtual environments (`.venv/` and nested virtual environments)

**Do not push these files until you have confirmed they contain no credentials or sensitive state.** Terraform state and plan files can contain secrets even when the configuration uses variables. Keep only a safe example such as `Week3/manifests/secret.example.yaml` in Git.

Use `security/github-pre-push-check.md` for the exact checks and safe cleanup procedure. If a real credential was ever committed or pushed, rotate it; deleting it in a later commit does not remove it from Git history.

## How to finish this folder

1. Extract this folder into the repository root, merging it with the existing empty `Week6/` directories if prompted.
2. Fill in the clearly marked `[FILL IN]` fields from your actual project.
3. Add genuine screenshots/logs to `Week6/evidence/`.
4. Complete the security pre-push checks before committing.
5. Commit and push only after reviewing `git status` and the staged diff.
