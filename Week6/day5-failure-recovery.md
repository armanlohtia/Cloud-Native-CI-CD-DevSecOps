# Day 5 — Failure Recovery Tests

## Objective
Intentionally introduce controlled failures, observe symptoms, diagnose them, recover the service, and capture evidence.

> **Status:** This document is a test plan. The four roadmap scenarios below are pending execution and must not be reported as passed until evidence is attached. Previously performed pod deletion and Argo CD drift demonstrations are useful additional self-healing evidence, but they do not replace these four failure scenarios.

## Safety rules
- Use a non-production namespace/environment.
- Record the known-good image tag, Helm values, and Git commit before each test.
- Perform one failure at a time.
- Never delete a namespace, persistent volume, cloud resource, or production Secret as part of this exercise.
- Restore the known-good configuration after each test and verify readiness and endpoint access.

## Scenario 1 — Broken image
**Inject:** Use a deliberately invalid image tag in a disposable test change/environment.

**Observe:** Pod events such as `ErrImagePull` or `ImagePullBackOff`.

**Diagnose:** `kubectl describe pod ...`, `kubectl get events ...`.

**Recover:** Restore the known-good image tag through the source of truth (Helm/Git) and allow Argo CD/Kubernetes to reconcile.

**Pass evidence:** Failure event, corrective Git change, successful rollout, all expected replicas Ready.

## Scenario 2 — Failed rollout
**Inject:** Apply a controlled invalid rollout change in a test environment (for example, an image that cannot be pulled or an invalid probe configuration).

**Observe:** Rollout progress/failure and unavailable replicas.

**Diagnose:** `kubectl rollout status deployment/<name>`, `kubectl describe deployment`, pod events and logs.

**Recover:** Revert the change in Git/Helm values and let the intended deployment reconcile. Use `kubectl rollout undo` only if it does not conflict with the GitOps source of truth; follow with Git reconciliation.

**Pass evidence:** Failed rollout output, revert/repair commit, successful rollout and healthy Argo CD status.

## Scenario 3 — Unavailable endpoint
**Inject:** In an isolated test environment, make the endpoint unavailable in a controlled way (for example, temporarily scale the test workload to zero or use an intentionally incorrect Service selector).

**Observe:** Failed HTTP request or unavailable endpoint.

**Diagnose:** Check Service selectors, EndpointSlices, pod readiness, and application logs.

**Recover:** Restore the original replica count/selector and verify that endpoints return.

**Pass evidence:** Before/after curl output, Service/EndpointSlice output, healthy pods.

## Scenario 4 — Bad configuration
**Inject:** Change a non-secret test configuration value to an invalid value in a disposable environment.

**Observe:** Application startup/readiness failure or incorrect behavior.

**Diagnose:** Inspect ConfigMap, pod events, logs, and readiness/liveness probe results.

**Recover:** Restore the known-good configuration in Git and allow reconciliation.

**Pass evidence:** Failure logs/events, corrective commit, successful readiness and application response.

## Test record

| Scenario | Executed? | Failure evidence | Recovery evidence | Result |
|---|---|---|---|---|
| Broken image | No — pending | [ADD] | [ADD] | Pending |
| Failed rollout | No — pending | [ADD] | [ADD] | Pending |
| Unavailable endpoint | No — pending | [ADD] | [ADD] | Pending |
| Bad configuration | No — pending | [ADD] | [ADD] | Pending |

## Additional self-healing work already reported
The project owner reported having previously demonstrated:
- Deleting an application pod and observing Kubernetes create a replacement.
- Changing live deployment state and observing Argo CD restore the Git-defined state.

Attach the actual screenshots/logs for these additional demonstrations if available. Do not use them as proof that the four Day 5 failure scenarios above were completed.
