## Tasks
1. Create Service `app-service` (type ClusterIP) on port 8090 targeting the app pods.
2. Create Ingress `app-ingress`:
   - host: `demo.example.com`
   - path: `/api`
   - backend: `app-service:8090`

## Verify
```bash
kubectl -n demo-app get ing,svc
curl -o /dev/null -s -w "%{http_code}\n" http://demo.example.com/api
```
