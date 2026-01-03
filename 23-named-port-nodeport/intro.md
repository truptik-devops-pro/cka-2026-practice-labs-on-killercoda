# 23: Add Named Port to Deployment + NodePort Service

## Goal
Reconfigure an existing Deployment to expose a named port, then create a NodePort Service using that named port.

## Requirements
- Deployment name: `ui-frontend`
- Namespace: `portal`

1. Update the Deployment and add port spec:
   - name: `http`
   - containerPort: `80`
   - protocol: `TCP`

2. Create a Service:
   - name: `ui-frontend-svc`
   - expose target port by name: `http`
   - type: `NodePort`
