# Project Architecture

## High-level flow

```text
Developer
   |
   v
Git repository (GitHub)
   |
   v
GitHub Actions CI
   |-- Python tests (pytest)
   |-- Lint (Ruff)
   |-- Static security scan (Bandit)
   |-- Docker image build
   |-- Container vulnerability scan (Trivy)
   |
   v
Container image (local CI build; registry publishing not shown
in the workflow inspected for this submission)

GitOps deployment path:
GitHub repository
   |
   v
Argo CD Application
   |-- source path: Week3/helm/task-api
   |-- target revision: main
   |-- automated sync
   |-- selfHeal enabled
   |-- prune enabled
   |
   v
Kubernetes cluster
   |-- namespace: devops-week3
   |-- Helm-managed task-api Deployment
   |-- task-api Service
   |-- task-api-config ConfigMap
   |
   v
Application endpoint

Monitoring area:
Prometheus <--> Kubernetes/application metrics
Grafana <--> Prometheus dashboards
```

## Infrastructure automation
Project 2 infrastructure automation is located under `Week5/terraform` and `Week5/ansible`. Update this section with the actual provider, resources, host configuration, and execution flow after reviewing the project documentation.

## Notes
- Argo CD was observed targeting `Week3/helm/task-api`, not `Week3/manifests/deployment.yaml`.
- The standalone manifests and Helm chart should be clearly distinguished to avoid editing the wrong source of truth.
- The inspected GitHub Actions workflow runs tests, Ruff, Bandit, Docker build, and Trivy. It did not show image publishing.
- Monitoring configuration folders exist, but live target/dashboard health still requires verification.
