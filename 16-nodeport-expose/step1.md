## Tasks
1. Update deployment `service-deployment` to expose container port:
   - port 8080
   - protocol TCP
   - name `http`

2. Create NodePort service `service-nodeport` exposing port 8080/TCP.

## Verify
```bash
kubectl -n services get deploy,svc
kubectl -n services describe svc service-nodeport
```
