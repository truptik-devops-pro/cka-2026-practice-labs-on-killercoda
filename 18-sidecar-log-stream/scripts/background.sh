#!/bin/bash
# Setup script for scenario 18

# Wait for cluster to be ready
until kubectl get nodes | grep -q " Ready"; do sleep 2; done

# Create the atlas-app pod (single container, writes to log file)
cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Pod
metadata:
  name: atlas-app
  labels:
    app: atlas
spec:
  containers:
  - name: atlas-main
    image: busybox:1.36
    command: ["/bin/sh", "-c"]
    args:
      - |
        while true; do
          echo "\$(date) - Atlas app running..." >> /var/log/atlas-app.log
          sleep 5
        done
    volumeMounts:
    - name: log-volume
      mountPath: /var/log
  volumes:
  - name: log-volume
    emptyDir: {}
EOF

echo "Setup complete. Pod atlas-app is running."
