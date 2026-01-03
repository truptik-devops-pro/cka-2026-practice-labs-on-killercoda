## Tasks
Create the StorageClass `local-storage` with:
- default annotation: `storageclass.kubernetes.io/is-default-class: "true"`
- provisioner: `rancher.io/local-path`
- volumeBindingMode: `WaitForFirstConsumer`

## Verify
```bash
kubectl get sc local-storage -o yaml
kubectl get sc local-storage -o jsonpath='{.metadata.annotations.storageclass\.kubernetes\.io/is-default-class}'; echo
kubectl get sc local-storage -o jsonpath='{.volumeBindingMode}'; echo
```
