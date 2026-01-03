# 16: NodePort Service Exposure

## Goal
Expose a deployment using NodePort on port 8080/TCP.

## Requirements
- Namespace: `services`
- Deployment: `service-deployment`
- Container port: 8080/TCP named `http`
- Service: `service-nodeport` type NodePort exposing 8080/TCP
