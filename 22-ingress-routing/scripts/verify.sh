#!/bin/bash
# Verify script for scenario 22

ING_EXISTS=$(kubectl -n ing-private get ing wave -o name 2>/dev/null)
ING_PATH=$(kubectl -n ing-private get ing wave -o jsonpath='{.spec.rules[0].http.paths[0].path}' 2>/dev/null)
ING_SVC=$(kubectl -n ing-private get ing wave -o jsonpath='{.spec.rules[0].http.paths[0].backend.service.name}' 2>/dev/null)

if [[ -n "$ING_EXISTS" ]] && [[ "$ING_PATH" == "/hello" ]] && [[ "$ING_SVC" == "hello" ]]; then
  echo "PASS: Ingress wave correctly configured"
  exit 0
else
  echo "FAIL: Ingress wave missing or misconfigured"
  exit 1
fi
