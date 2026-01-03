# 10: HPA (CPU 60%, 2-6 pods, downscale 45s)

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
