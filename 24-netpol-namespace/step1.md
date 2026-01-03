## Tasks
1. Create NetworkPolicy `allow-9000-from-team` in namespace `echo`
2. Allow ingress to port 9000/TCP only from namespace `team-app`
3. Ensure it only applies to pods with a specific label (e.g., `app: echo-server`)

## Suggested commands
```bash
# Label the team-app namespace (if not already)
kubectl label namespace team-app name=team-app --overwrite

# Create NetworkPolicy
cat <<EOF | kubectl apply -f -
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: allow-9000-from-team
  namespace: echo
spec:
  podSelector:
    matchLabels:
      app: echo-server
  policyTypes:
  - Ingress
  ingress:
  - from:
    - namespaceSelector:
        matchLabels:
          name: team-app
    ports:
    - protocol: TCP
      port: 9000
EOF
```

## Verify
```bash
kubectl -n echo get netpol allow-9000-from-team -o yaml
kubectl -n echo describe netpol allow-9000-from-team
# Connectivity tests depend on lab setup:
# kubectl -n team-app exec <pod> -- curl http://<echo-svc>:9000
# kubectl -n default exec <pod> -- curl http://<echo-svc>:9000  # should fail
```
