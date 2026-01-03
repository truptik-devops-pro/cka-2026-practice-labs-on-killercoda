#!/bin/bash
# Verify script for scenario 24

NETPOL_EXISTS=$(kubectl -n echo get netpol allow-9000-from-team -o name 2>/dev/null)
NETPOL_PORT=$(kubectl -n echo get netpol allow-9000-from-team -o jsonpath='{.spec.ingress[0].ports[0].port}' 2>/dev/null)

if [[ -n "$NETPOL_EXISTS" ]] && [[ "$NETPOL_PORT" == "9000" ]]; then
  echo "PASS: NetworkPolicy allow-9000-from-team correctly configured"
  exit 0
else
  echo "FAIL: NetworkPolicy missing or misconfigured"
  exit 1
fi
