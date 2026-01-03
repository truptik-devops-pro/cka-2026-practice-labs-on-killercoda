#!/bin/bash
# Setup script for scenario 22

until kubectl get nodes | grep -q " Ready"; do sleep 2; done

# Create namespace
kubectl create namespace ing-private

# Create a simple hello service
cat <<EOF | kubectl apply -f -
apiVersion: apps/v1
kind: Deployment
metadata:
  name: hello
  namespace: ing-private
spec:
  replicas: 1
  selector:
    matchLabels:
      app: hello
  template:
    metadata:
      labels:
        app: hello
    spec:
      containers:
      - name: hello
        image: hashicorp/http-echo:0.2.3
        args: ["-text=Hello from Kubernetes!"]
        ports:
        - containerPort: 5678
---
apiVersion: v1
kind: Service
metadata:
  name: hello
  namespace: ing-private
spec:
  selector:
    app: hello
  ports:
  - port: 5678
    targetPort: 5678
EOF

echo "Setup complete. Service hello ready in ing-private namespace."
