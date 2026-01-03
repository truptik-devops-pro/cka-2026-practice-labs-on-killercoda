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
kubectl create ns itk-priority >/dev/null 2>&1 || true

# Ensure a "user-defined" PriorityClass exists
cat <<'YAML' | kubectl apply -f -
apiVersion: scheduling.k8s.io/v1
kind: PriorityClass
metadata:
  name: itk-medium
value: 10000
globalDefault: false
description: "Seed PriorityClass for labs"
YAML

# Create / reset deployment
cat <<'YAML' | kubectl apply -f -
apiVersion: apps/v1
kind: Deployment
metadata:
  name: itk-logger
  namespace: itk-priority
spec:
  replicas: 1
  selector:
    matchLabels:
      app: itk-logger
  template:
    metadata:
      labels:
        app: itk-logger
    spec:
      containers:
      - name: logger
        image: busybox:1.36
        command: ["sh","-c","while true; do date; sleep 5; done"]
YAML
