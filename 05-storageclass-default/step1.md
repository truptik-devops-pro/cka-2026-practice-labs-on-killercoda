### Requirements
- StorageClass name: `itk-local`
- provisioner: `rancher.io/local-path`
- `volumeBindingMode: WaitForFirstConsumer`
- Set as default StorageClass (annotation)

### Useful checks
```bash
kubectl get sc
kubectl describe sc itk-local
```
