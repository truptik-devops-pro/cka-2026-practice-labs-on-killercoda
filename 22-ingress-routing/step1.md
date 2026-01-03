## Tasks
1. Verify the namespace `ing-private` and service `hello` exist
2. Create Ingress `wave` in namespace `ing-private`
3. Route path `/hello` to service `hello` on port `5678`

## Suggested commands
```bash
# Check existing resources
kubectl get ns ing-private
kubectl -n ing-private get svc hello

# Create Ingress
cat <<EOF | kubectl apply -f -
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: wave
  namespace: ing-private
spec:
  rules:
  - http:
      paths:
      - path: /hello
        pathType: Prefix
        backend:
          service:
            name: hello
            port:
              number: 5678
EOF
```

## Verify
```bash
kubectl -n ing-private get ing wave -o yaml
kubectl -n ing-private describe ing wave
# Optional runtime test if DNS/host configured:
# curl -I http://<ingress-address>/hello
```
