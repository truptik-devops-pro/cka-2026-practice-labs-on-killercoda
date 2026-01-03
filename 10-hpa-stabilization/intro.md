## Goal
Create an HPA for nginx with stable downscaling behavior.

## Requirements
- Namespace: `scaling`
- HPA: `nginx-scaler`
- Target deployment: `nginx-deployment`
- CPU target: 60%
- minReplicas: 2
- maxReplicas: 6
- downscale stabilization window: 45s
