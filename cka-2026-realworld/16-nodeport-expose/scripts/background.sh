#!/usr/bin/env bash
set -euo pipefail

# Common helpers
wait_kube() {{
  echo "Waiting for Kubernetes API..."
  for i in $(seq 1 60); do
    if kubectl get ns >/dev/null 2>&1; then
      return 0
    fi
    sleep 2
  done
  echo "Kubernetes API not ready"
  exit 1
}}

wait_kube
kubectl create ns itk-nodeport >/dev/null 2>&1 || true

# Create deployment with "wrong" port so student must fix it
cat <<'YAML' | kubectl apply -f -
apiVersion: apps/v1
kind: Deployment
metadata:
  name: itk-nodeport-dep
  namespace: itk-nodeport
spec:
  replicas: 1
  selector:
    matchLabels:
      app: itk-nodeport
  template:
    metadata:
      labels:
        app: itk-nodeport
    spec:
      containers:
      - name: web
        image: nginx:1.27
        ports:
        - containerPort: 8080
          name: web
YAML

# Cleanup service if rerun
kubectl delete svc itk-nodeport-svc -n itk-nodeport --ignore-not-found
