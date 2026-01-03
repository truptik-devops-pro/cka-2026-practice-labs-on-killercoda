#!/bin/bash
# Verify script for scenario 23

PORT_NAME=$(kubectl -n portal get deploy ui-frontend -o jsonpath='{.spec.template.spec.containers[0].ports[0].name}' 2>/dev/null)
SVC_EXISTS=$(kubectl -n portal get svc ui-frontend-svc -o name 2>/dev/null)
SVC_TYPE=$(kubectl -n portal get svc ui-frontend-svc -o jsonpath='{.spec.type}' 2>/dev/null)

if [[ "$PORT_NAME" == "http" ]] && [[ -n "$SVC_EXISTS" ]] && [[ "$SVC_TYPE" == "NodePort" ]]; then
  echo "PASS: Named port and NodePort service configured correctly"
  exit 0
else
  echo "FAIL: Missing named port or NodePort service"
  exit 1
fi
