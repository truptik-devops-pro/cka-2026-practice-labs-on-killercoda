## Goal
Expose an application via Ingress and confirm HTTP 200.

## Requirements
- Namespace: `demo-app`
- Ingress: `app-ingress`
- Service: `app-service` (ClusterIP) on port 8090
- Host: `demo.example.com`
- Path: `/api`
