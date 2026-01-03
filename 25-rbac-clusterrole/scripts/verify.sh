#!/bin/bash
# Verify script for scenario 25

CR_EXISTS=$(kubectl get clusterrole pipeline-deployer -o name 2>/dev/null)
SA_EXISTS=$(kubectl -n app-squad get sa cicd-bot -o name 2>/dev/null)
RB_EXISTS=$(kubectl -n app-squad get rolebinding pipeline-deployer-binding -o name 2>/dev/null)

CAN_CREATE=$(kubectl auth can-i create deployments --as=system:serviceaccount:app-squad:cicd-bot -n app-squad 2>/dev/null)

if [[ -n "$CR_EXISTS" ]] && [[ -n "$SA_EXISTS" ]] && [[ -n "$RB_EXISTS" ]] && [[ "$CAN_CREATE" == "yes" ]]; then
  echo "PASS: RBAC correctly configured"
  exit 0
else
  echo "FAIL: RBAC not properly configured"
  exit 1
fi
