## Tasks
Create `autoscaling/v2` HPA `nginx-scaler` targeting `nginx-deployment` with:
- 60% CPU target
- min 2, max 6
- scaleDown stabilizationWindowSeconds: 45

## Verify
```bash
kubectl -n scaling get hpa
kubectl -n scaling describe hpa nginx-scaler
kubectl -n scaling get hpa nginx-scaler -o yaml | sed -n '/behavior:/,/metrics:/p'
```
