#!/bin/bash
# Setup script for scenario 23

until kubectl get nodes | grep -q " Ready"; do sleep 2; done

# Create namespace
kubectl create namespace portal

# Create deployment without port spec
cat <<EOF | kubectl apply -f -
apiVersion: apps/v1
kind: Deployment
metadata:
  name: ui-frontend
  namespace: portal
spec:
  replicas: 1
  selector:
    matchLabels:
      app: ui-frontend
  template:
    metadata:
      labels:
        app: ui-frontend
    spec:
      containers:
      - name: nginx
        image: nginx:1.27
EOF

echo "Setup complete. Deployment ui-frontend ready in portal namespace."
