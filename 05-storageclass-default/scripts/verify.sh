#!/usr/bin/env bash
set -euo pipefail

sc="itk-local"

kubectl get sc "$sc" >/dev/null

# Check provisioner
prov="$(kubectl get sc "$sc" -o jsonpath='{.provisioner}')"
test "$prov" = "rancher.io/local-path"

# Check volumeBindingMode
vbm="$(kubectl get sc "$sc" -o jsonpath='{.volumeBindingMode}')"
test "$vbm" = "WaitForFirstConsumer"

# Check default annotation
ann="$(kubectl get sc "$sc" -o jsonpath='{.metadata.annotations.storageclass\.kubernetes\.io/is-default-class}')"
test "$ann" = "true"

echo "PASS: StorageClass itk-local exists, WFFC set, and is default."
