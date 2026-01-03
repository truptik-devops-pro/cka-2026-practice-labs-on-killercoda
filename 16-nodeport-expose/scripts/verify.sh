#!/usr/bin/env bash
set -euo pipefail
ns="itk-nodeport"

kubectl get deploy itk-nodeport-dep -n "$ns" >/dev/null
kubectl get svc itk-nodeport-svc -n "$ns" >/dev/null

# Check service type
stype="$(kubectl get svc itk-nodeport-svc -n "$ns" -o jsonpath='{.spec.type}')"
test "$stype" = "NodePort"

# Check service port 80/TCP
sport="$(kubectl get svc itk-nodeport-svc -n "$ns" -o jsonpath='{.spec.ports[0].port}')"
proto="$(kubectl get svc itk-nodeport-svc -n "$ns" -o jsonpath='{.spec.ports[0].protocol}')"
test "$sport" = "80"
test "$proto" = "TCP"

# Check deployment containerPort 80 named http
cport="$(kubectl get deploy itk-nodeport-dep -n "$ns" -o jsonpath='{.spec.template.spec.containers[0].ports[0].containerPort}')"
cname="$(kubectl get deploy itk-nodeport-dep -n "$ns" -o jsonpath='{.spec.template.spec.containers[0].ports[0].name}')"
test "$cport" = "80"
test "$cname" = "http"

echo "PASS: Deployment exposes 80/http and NodePort service is correct."
