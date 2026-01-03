## Tasks
1. Inspect existing Ingress `api-ingress` to capture:
   - host
   - tls secret
   - backend service + port
   - paths/rules

2. Create Gateway:
   - name: `api-gateway`
   - hostname: `api.demo.k8s.local`
   - GatewayClass: `nginx-gateway`
   - HTTPS listener using same TLS secret as Ingress

3. Create HTTPRoute:
   - name: `api-route`
   - hostname: `api.demo.k8s.local`
   - attach to `api-gateway` using parentRefs
   - same routing rules as Ingress

## Verify
```bash
kubectl get gateway,httproute -A
kubectl describe gateway api-gateway
kubectl describe httproute api-route
```
