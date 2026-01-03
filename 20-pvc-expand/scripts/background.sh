#!/bin/bash
# Setup script for scenario 20

until kubectl get nodes | grep -q " Ready"; do sleep 2; done

mkdir -p /opt/CKA2026

# Create StorageClass with volume expansion enabled
cat <<EOF | kubectl apply -f -
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: csi-hostpath-sc
provisioner: hostpath.csi.k8s.io
allowVolumeExpansion: true
volumeBindingMode: WaitForFirstConsumer
EOF

echo "Setup complete. StorageClass csi-hostpath-sc is ready."
