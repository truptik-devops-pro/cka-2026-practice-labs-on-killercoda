## Tasks
1. Scale deployment to 1 replica:
```bash
kubectl scale deploy webapp-deployment --replicas=1
```

2. Calculate fair per-pod resources for 3 replicas using node allocatable, minus existing requests, with overhead (ex: 10%).

3. Edit the deployment:
   - apply the same requests/limits to initContainers and containers

4. Scale back to 3:
```bash
kubectl scale deploy webapp-deployment --replicas=3
kubectl rollout status deploy/webapp-deployment
```

## Verify
```bash
kubectl get pods -l app=webapp
kubectl describe pod <pod> | egrep -A6 "Requests|Limits"
```
