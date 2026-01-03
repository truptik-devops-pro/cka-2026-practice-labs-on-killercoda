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
# Delete pod if rerun
kubectl delete pod itk-taint-test --ignore-not-found
# Remove taint if rerun (best-effort)
kubectl taint node node01 IT=Kiddie:NoSchedule- >/dev/null 2>&1 || true
