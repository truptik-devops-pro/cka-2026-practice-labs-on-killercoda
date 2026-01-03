#!/bin/bash
# Verify script for scenario 18

CONTAINER_COUNT=$(kubectl get pod atlas-app -o jsonpath='{.spec.containers[*].name}' 2>/dev/null | wc -w)
HAS_SIDECAR=$(kubectl get pod atlas-app -o jsonpath='{.spec.containers[*].name}' 2>/dev/null | grep -c "log-sidecar" || true)

if [[ "$CONTAINER_COUNT" -ge 2 ]] && [[ "$HAS_SIDECAR" -ge 1 ]]; then
  echo "PASS: Pod has sidecar container log-sidecar"
  exit 0
else
  echo "FAIL: Pod does not have the required sidecar container"
  exit 1
fi
