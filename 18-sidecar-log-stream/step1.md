## Tasks
1. Edit the existing Pod `atlas-app` to add a sidecar container
2. Sidecar container name: `log-sidecar`
3. Sidecar image: `busybox:1.36`
4. Sidecar command: `/bin/sh -c "tail -n+1 -F /var/log/atlas-app.log"`
5. Use a shared Volume (e.g., `emptyDir`) mounted at `/var/log` in both containers

## Verify
```bash
# Pod has 2 containers:
kubectl get pod atlas-app -o jsonpath='{.spec.containers[*].name}'; echo

# Sidecar is streaming:
kubectl logs atlas-app -c log-sidecar --tail=30
```
