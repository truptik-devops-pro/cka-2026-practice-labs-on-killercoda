## Tasks
Install Calico (v3.27.4) using the manifest:
```bash
kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.27.4/manifests/tigera-operator.yaml
```

## Verify
```bash
kubectl get pods -A | grep -E 'calico|tigera' || true
kubectl get nodes
```
