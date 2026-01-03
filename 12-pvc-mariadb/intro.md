# 12: PVC + update deployment manifest

## Goal
Claim an existing retained PV with a PVC and update a deployment to use it.

## Requirements
- Namespace: `database`
- PVC: `database-storage`
- RWO, 500Mi
- Update `/opt/database.yaml` to use the PVC
