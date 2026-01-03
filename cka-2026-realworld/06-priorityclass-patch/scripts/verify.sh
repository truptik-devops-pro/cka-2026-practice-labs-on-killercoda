#!/usr/bin/env bash
set -euo pipefail

# Check PriorityClass exists
kubectl get priorityclass itk-high >/dev/null

# Check deployment uses it
pc="$(kubectl get deploy itk-logger -n itk-priority -o jsonpath='{.spec.template.spec.priorityClassName}')"
test "$pc" = "itk-high"

echo "PASS: PriorityClass itk-high exists and deployment itk-logger uses it."
