# 05: StorageClass Configuration (default + WFFC)

## Goal
Create a default StorageClass for local-path provisioning.

## Requirements
- StorageClass: `local-storage`
- provisioner: `rancher.io/local-path`
- volumeBindingMode: `WaitForFirstConsumer`
- set as default
- do not modify existing Deployments or PVCs
