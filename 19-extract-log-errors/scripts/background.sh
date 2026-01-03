#!/bin/bash
# Setup script for scenario 19

until kubectl get nodes | grep -q " Ready"; do sleep 2; done

mkdir -p /opt/CKA2026/payment-api

# Create payment-api pod that generates logs including errors
cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Pod
metadata:
  name: payment-api
  labels:
    app: payment
spec:
  containers:
  - name: payment
    image: busybox:1.36
    command: ["/bin/sh", "-c"]
    args:
      - |
        i=0
        while true; do
          i=\$((i+1))
          if [ \$((i % 3)) -eq 0 ]; then
            echo "\$(date) error file-not-found: /data/config-\$i.json"
          else
            echo "\$(date) INFO: Processing request \$i"
          fi
          sleep 2
        done
EOF

sleep 10
echo "Setup complete. Pod payment-api is generating logs."
