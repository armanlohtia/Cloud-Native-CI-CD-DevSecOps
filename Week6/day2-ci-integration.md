# Day 2 — CI Integration

## Objective
Run automated tests, build the application image, scan code and image for security issues, and publish the image if registry publishing is configured.

## Workflow inspected
File: `.github/workflows/ci.yml`

The supplied workflow contains:
1. GitHub Actions triggers for push, pull request, and manual dispatch.
2. Python 3.12 setup and dependency installation.
3. `python -m pytest -v`.
4. `ruff check .`.
5. `bandit -r app`.
6. `docker build -t cloud-native-task-api:ci .`.
7. Trivy scan of `cloud-native-task-api:ci`, configured to fail on HIGH/CRITICAL findings (with unfixed findings ignored).

## Important limitation
The supplied workflow did not show a registry login or Docker image push step. Therefore, image publishing is recorded as **not verified / not configured in the inspected workflow**, rather than claimed complete.

## Verification checklist
- [ ] Open the latest GitHub Actions run and confirm the workflow completed.
- [ ] Confirm pytest passed.
- [ ] Confirm Ruff passed.
- [ ] Confirm Bandit passed.
- [ ] Confirm Docker build passed.
- [ ] Review Trivy findings and record any accepted exceptions with rationale.
- [ ] If image publishing is required, add registry authentication using GitHub Actions secrets and least-privilege permissions; never place tokens in YAML.
- [ ] Record the image name, immutable tag/digest, registry, and run URL if publishing is configured.

## Evidence
Add the GitHub Actions run summary and relevant job logs to `Week6/evidence/`. Do not include credentials or secret values.
