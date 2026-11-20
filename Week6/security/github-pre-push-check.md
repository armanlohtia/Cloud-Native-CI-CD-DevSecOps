# GitHub Pre-Push Security Check

The supplied repository listing contained files that should not normally be committed:
- `Week3/manifests/secret.yml`
- `Week5/terraform/terraform.tfstate`
- `Week5/terraform/terraform.tfstate.backup`
- `Week5/terraform/tfplan`
- `.venv/` and nested virtual environments

## 1. Check what is already tracked
Run from repository root:

```bash
git status --short
git ls-files | grep -E '(^|/)(\.venv|venv|__pycache__|\.pytest_cache|\.ruff_cache|\.terraform)(/|$)|(^|/)(terraform\.tfstate(\.backup)?|tfplan|secret\.yml|\.env)$'
```

## 2. Inspect secret file locally without printing its contents
```bash
test -f Week3/manifests/secret.yml && echo "secret.yml exists — inspect locally; do not cat it"
```

If it contains a real credential, remove it from Git tracking and keep a safe example template instead. If already pushed, rotate the credential. A new commit deleting a secret does not erase it from history.

## 3. Add these patterns to the repository-root `.gitignore`
Merge these entries into the existing `.gitignore`; do not blindly overwrite existing rules:

```gitignore
# Python environments and caches
.venv/
venv/
__pycache__/
.pytest_cache/
.ruff_cache/
*.py[cod]

# Local secrets
.env
.env.*
!.env.example
**/secret.yml
**/secrets*.yaml
*.pem
*.key
kubeconfig

# Terraform generated/local state
**/.terraform/
*.tfstate
*.tfstate.*
*.tfplan
crash.log
```

Keep `Week3/manifests/secret.example.yaml` only if it contains placeholders and no real credentials.

## 4. Stop tracking sensitive/generated files if they are tracked
Only after confirming the listed files are not required as source artifacts, use:

```bash
git rm --cached --ignore-unmatch Week3/manifests/secret.yml
git rm --cached --ignore-unmatch Week5/terraform/terraform.tfstate
git rm --cached --ignore-unmatch Week5/terraform/terraform.tfstate.backup
git rm --cached --ignore-unmatch Week5/terraform/tfplan
```

For tracked virtual environments, list exact paths first and remove only those paths from the index with `git rm -r --cached <exact-path>`. This preserves local files.

**Terraform caution:** Preserve the state securely if it is needed to manage or destroy existing resources. Do not delete local state until infrastructure ownership and cleanup are understood. Use a secure remote backend for shared state where appropriate.

## 5. Review before commit
```bash
git status --short
git diff --check
git diff --cached --stat
git diff --cached
```

If a real credential was ever committed or pushed, rotate/revoke it and consider repository history remediation. Do not assume `.gitignore` removes files already tracked.
