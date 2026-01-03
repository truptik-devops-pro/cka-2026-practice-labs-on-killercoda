## Tasks
1. Edit the existing ConfigMap used by `web-server` to allow only TLSv1.3.
2. Add service IP to `/etc/hosts` as `secure.demo.local`
3. Validate:
```bash
curl --tls-max 1.2 https://secure.demo.local -k  # should fail
curl --tlsv1.3 https://secure.demo.local -k      # should work
```

## Verify helpers
```bash
SVC_IP=$(kubectl -n web get svc web-service -o jsonpath='{.spec.clusterIP}')
echo "$SVC_IP secure.demo.local" | sudo tee -a /etc/hosts
tail -n 3 /etc/hosts
```
