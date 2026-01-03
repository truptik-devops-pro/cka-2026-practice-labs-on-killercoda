#!/bin/bash
# Setup script for scenario 25

until kubectl get nodes | grep -q " Ready"; do sleep 2; done

# Create namespace
kubectl create namespace app-squad

echo "Setup complete. Namespace app-squad is ready."
