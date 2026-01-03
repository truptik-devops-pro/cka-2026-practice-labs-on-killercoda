## Tasks
1. Inspect kube-apiserver static pod manifest:
   - `/etc/kubernetes/manifests/kube-apiserver.yaml`

2. Find `--etcd-servers=...:2380` and correct it to `:2379`

3. Save and wait for kubelet to restart static pod

## Verify
```bash
kubectl get nodes
kubectl -n kube-system get pods | grep kube-apiserver || true
```
