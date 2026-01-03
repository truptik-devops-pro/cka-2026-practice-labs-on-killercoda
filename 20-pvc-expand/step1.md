## Tasks
1. Create PVC `site-content` with StorageClass `csi-hostpath-sc`, RWO, 12Mi
2. Create Pod `nginx-site` using image `nginx:1.27` and mount the PVC at `/usr/share/nginx/html`
3. Expand the PVC to 80Mi
4. Save the updated PVC YAML to `/opt/CKA2026/resize-record.yaml`

## Suggested commands
```bash
# Create PVC
cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: site-content
spec:
  accessModes:
    - ReadWriteOnce
  storageClassName: csi-hostpath-sc
  resources:
    requests:
      storage: 12Mi
EOF

# Create Pod with mount
cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Pod
metadata:
  name: nginx-site
spec:
  containers:
  - name: nginx
    image: nginx:1.27
    volumeMounts:
    - name: site-data
      mountPath: /usr/share/nginx/html
  volumes:
  - name: site-data
    persistentVolumeClaim:
      claimName: site-content
EOF

# Expand PVC
kubectl patch pvc site-content -p '{"spec":{"resources":{"requests":{"storage":"80Mi"}}}}'

# Save record
mkdir -p /opt/CKA2026
kubectl get pvc site-content -o yaml > /opt/CKA2026/resize-record.yaml
```

## Verify
```bash
kubectl get pvc site-content
kubectl get pod nginx-site
kubectl describe pod nginx-site | grep -A4 -i "Mounts"
grep -n "storage:" /opt/CKA2026/resize-record.yaml
```
