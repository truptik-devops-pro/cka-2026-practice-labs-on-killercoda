## Tasks
1. Taint node:
```bash
kubectl taint node worker-node01 Env=Production:NoSchedule
```

2. Create pod `prod-pod` with toleration for:
   - key `Env`
   - value `Production`
   - effect `NoSchedule`

Ensure it lands on `worker-node01` (use nodeName if needed).

## Verify
```bash
kubectl describe node worker-node01 | sed -n '/Taints:/,/Unschedulable:/p'
kubectl get pod prod-pod -o wide
```
