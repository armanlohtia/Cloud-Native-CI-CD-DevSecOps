# Day 3 — Helm, Argo CD and Monitoring Validation

## Objective
Validate the Helm release, Argo CD reconciliation, Kubernetes workload health, and monitoring stack.

## Observed application state (2026-11-20)
The following command outputs were supplied during troubleshooting:
- `kubectl get deployments -n devops-week3`: `task-api` showed 3/3 READY, 3 UP-TO-DATE, 3 AVAILABLE.
- `kubectl get pods -n devops-week3`: all three `task-api` pods later showed `1/1 Running`.
- `kubectl get secret task-api-secret -n devops-week3`: Secret existed with one data key (the value was not displayed).
- `kubectl get application task-api -n argocd`: `Synced` and `Healthy`.
- Argo CD Application source: Git repository `ICP-427D20C3-2026-REPO`, target revision `main`, path `Week3/helm/task-api`.
- Automated sync configuration showed `prune: true` and `selfHeal: true`.

## Monitoring
Repository paths observed:
- `Week4/prometheus`
- `Week4/grafana`
- `Week4/evidence`

The existence of these folders does not by itself prove that monitoring is currently operational.

## Verification checklist
- [x] Argo CD Application was observed Synced and Healthy.
- [x] Three application pods were observed 1/1 Ready and Running.
- [ ] Verify Helm release status and values.
- [ ] Verify Prometheus targets are UP.
- [ ] Verify Grafana dashboards load and show current cluster/application metrics.
- [ ] Capture monitoring screenshots and relevant command output.

## Secret/pruning note
Argo CD operation history showed `task-api-secret` as `Pruned` at an earlier sync. The Secret was later recreated manually. Confirm the intended secret-management approach (for example, externally managed Secret or a secure secret-management integration) before relying on future syncs. Do not commit a live credential file.

## Evidence
Save Argo CD health/sync, pod/deployment status, Prometheus targets, and Grafana dashboard screenshots in `Week6/evidence/`.
