#!/usr/bin/env bash
set -euo pipefail

# Detect node name
node="node01"
if ! kubectl get node "$node" >/dev/null 2>&1; then
  node="$(kubectl get nodes -o jsonpath='{.items[0].metadata.name}')"
fi

# Check taint exists
taints="$(kubectl get node "$node" -o jsonpath='{range .spec.taints[*]}{.key}{"="}{.value}{":"}{.effect}{"\n"}{end}')"
echo "$taints" | grep -q '^IT=Kiddie:NoSchedule$'

# Check pod exists and scheduled to node
kubectl get pod itk-taint-test >/dev/null
pnode="$(kubectl get pod itk-taint-test -o jsonpath='{.spec.nodeName}')"
test "$pnode" = "$node"

echo "PASS: Node tainted and pod scheduled on the tainted node."
