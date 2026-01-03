### Useful checks
```bash
kubectl get deploy -n itk-nodeport itk-nodeport-dep -o yaml | less
kubectl get svc -n itk-nodeport
kubectl describe svc -n itk-nodeport itk-nodeport-svc
```
