#!/bin/bash
# Setup script for scenario 21

until kubectl get nodes | grep -q " Ready"; do sleep 2; done

# Label the node with disk=ssd
NODE=$(kubectl get nodes -o jsonpath='{.items[0].metadata.name}')
kubectl label node "$NODE" disk=ssd --overwrite

echo "Setup complete. Node $NODE labeled with disk=ssd"
