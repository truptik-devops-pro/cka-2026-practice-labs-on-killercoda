### Commands you’ll likely use
```bash
kubectl get nodes
kubectl taint node node01 IT=Kiddie:NoSchedule
kubectl run itk-taint-test --image=busybox:1.36 -- sleep 3600
kubectl get pod -o wide
```
