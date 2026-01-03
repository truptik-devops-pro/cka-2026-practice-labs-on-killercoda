## Tasks
1. Create PVC `database-storage` in namespace `database` (RWO, 500Mi)
2. Edit `/opt/database.yaml` to mount and use this PVC
3. Apply and verify deployment is running and stable

## Verify
```bash
kubectl -n database get pvc database-storage
kubectl -n database describe pvc database-storage
kubectl -n database get pods
```
