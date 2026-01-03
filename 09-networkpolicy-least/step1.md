## Tasks
Create a NetworkPolicy that allows only the required interaction:
- allow ingress to backend only from frontend
- restrict to required port(s) if known
- keep everything else blocked (least permissive)

## Verify
```bash
kubectl get netpol -A
kubectl -n backend describe netpol <policy-name>
```
