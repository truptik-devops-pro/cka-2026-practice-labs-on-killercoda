#!/bin/bash
# Verify script for scenario 21

POD_EXISTS=$(kubectl get pod nginx-kusc01801 -o name 2>/dev/null)
NODE_SELECTOR=$(kubectl get pod nginx-kusc01801 -o jsonpath='{.spec.nodeSelector.disk}' 2>/dev/null)

if [[ -n "$POD_EXISTS" ]] && [[ "$NODE_SELECTOR" == "ssd" ]]; then
  echo "PASS: Pod nginx-kusc01801 has correct nodeSelector"
  exit 0
else
  echo "FAIL: Pod missing or nodeSelector incorrect"
  exit 1
fi
