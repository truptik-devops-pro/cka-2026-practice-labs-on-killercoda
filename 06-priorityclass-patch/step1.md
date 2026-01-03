## Tasks
1. Find the highest existing user-defined PriorityClass value:
```bash
kubectl get priorityclass -o wide
```

2. Create PriorityClass `critical-priority` with value (highest - 1)

3. Patch deployment `logger-app` in namespace `production` to use:
   - priorityClassName: `critical-priority`

## Verify
```bash
kubectl get priorityclass critical-priority
kubectl get deploy logger-app -n production -o jsonpath='{.spec.template.spec.priorityClassName}'; echo
```
