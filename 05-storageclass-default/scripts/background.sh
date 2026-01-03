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
# Cleanup if rerun
kubectl delete sc itk-local --ignore-not-found
