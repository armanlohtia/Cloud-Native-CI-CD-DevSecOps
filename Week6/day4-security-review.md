# Day 4 — Security Review

## Objective
Review secrets, image vulnerabilities, least privilege, network exposure, and application dependencies.

## Findings requiring attention
- `Week3/manifests/secret.example.yaml` is a safe template only if it contains placeholders, not real credentials.
- `Week3/manifests/secret.yml` was present in the repository file listing. Inspect locally; do not print or commit its secret values. If it contains a real password, remove it from Git tracking and rotate the credential if it was pushed.
- The CI workflow runs Bandit and Trivy. A configured scan is not proof of a clean scan; retain the actual scan output.
- Terraform state, backup state, and plan files were present under `Week5/terraform`. These may contain sensitive values and should not be committed.
- Python virtual environment directories were present. They should not be versioned.

## Security checklist
- [ ] No passwords, tokens, private keys, kubeconfigs, or production `.env` files in Git.
- [ ] Kubernetes Secret values are not displayed in evidence or logs.
- [ ] Secret lifecycle is documented and Argo CD pruning cannot unexpectedly delete required externally managed secrets.
- [ ] Review Bandit output and resolve or document findings.
- [ ] Review Trivy output and resolve HIGH/CRITICAL vulnerabilities or document justified exceptions.
- [ ] Pin and review dependencies; update vulnerable packages.
- [ ] Use least-privilege Kubernetes ServiceAccounts and RBAC.
- [ ] Review container user, filesystem permissions, capabilities, and image base.
- [ ] Review Service type, Ingress, exposed ports, firewall/security groups, and public access.
- [ ] Review Terraform IAM/network permissions and remove unused cloud resources.
- [ ] Add generated files and secret files to `.gitignore`.

## Evidence
Record scan summaries, RBAC review, Service/Ingress exposure, dependency review, and sanitized configuration excerpts. Never capture secret values.
