## Tasks
1. List Istio CRDs (default output):
```bash
kubectl get crd | grep istio.io > ~/crds-list.yaml
```

2. Explain VirtualService hosts field:
```bash
kubectl explain virtualservice.spec.hosts > ~/hosts-spec.yaml
# If needed (fully-qualified):
kubectl explain virtualservice.networking.istio.io.spec.hosts > ~/hosts-spec.yaml
```

## Verify
```bash
ls -lh ~/crds-list.yaml ~/hosts-spec.yaml
head -n 20 ~/crds-list.yaml
head -n 40 ~/hosts-spec.yaml
```
