#!/bin/bash
# Setup script for scenario 24

until kubectl get nodes | grep -q " Ready"; do sleep 2; done

# Create namespaces
kubectl create namespace echo
kubectl create namespace team-app
kubectl label namespace team-app name=team-app --overwrite

# Create echo server in echo namespace
cat <<EOF | kubectl apply -f -
apiVersion: apps/v1
kind: Deployment
metadata:
  name: echo-server
  namespace: echo
spec:
  replicas: 1
  selector:
    matchLabels:
      app: echo-server
  template:
    metadata:
      labels:
        app: echo-server
    spec:
      containers:
      - name: echo
        image: hashicorp/http-echo:0.2.3
        args: ["-listen=:9000", "-text=Hello from echo"]
        ports:
        - containerPort: 9000
---
apiVersion: v1
kind: Service
metadata:
  name: echo-svc
  namespace: echo
spec:
  selector:
    app: echo-server
  ports:
  - port: 9000
    targetPort: 9000
EOF

echo "Setup complete. Echo server ready in echo namespace."
