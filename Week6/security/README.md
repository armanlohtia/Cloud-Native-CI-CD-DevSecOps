# Security Review Record

Use `day4-security-review.md` for the full checklist.

## Known repository hygiene risks observed
The repository listing included a live-looking `Week3/manifests/secret.yml`, Terraform state and backup files, a Terraform plan, and virtual environments. Inspect and protect these before pushing.

## Security review result
- Secret scan: [PENDING]
- Bandit: [ADD ACTUAL RESULT]
- Trivy: [ADD ACTUAL RESULT]
- Dependency review: [PENDING]
- RBAC/least privilege: [PENDING]
- Network exposure: [PENDING]
- Terraform/IAM review: [PENDING]

Do not paste secret values into this file.
