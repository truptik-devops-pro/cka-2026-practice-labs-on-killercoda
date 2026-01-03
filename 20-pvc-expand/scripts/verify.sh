#!/bin/bash
# Verify script for scenario 20

PVC_EXISTS=$(kubectl get pvc site-content -o name 2>/dev/null)
POD_EXISTS=$(kubectl get pod nginx-site -o name 2>/dev/null)
FILE_EXISTS=$(test -f /opt/CKA2026/resize-record.yaml && echo "yes" || echo "no")

if [[ -n "$PVC_EXISTS" ]] && [[ -n "$POD_EXISTS" ]] && [[ "$FILE_EXISTS" == "yes" ]]; then
  echo "PASS: PVC, Pod, and resize record exist"
  exit 0
else
  echo "FAIL: Missing PVC, Pod, or resize record"
  exit 1
fi
