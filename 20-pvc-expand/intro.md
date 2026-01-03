# 20: PVC + Pod Mount + Expand PVC

## Goal
Create a PVC, mount it into a Pod, then expand the PVC and record the change.

## Requirements
1. Create a PersistentVolumeClaim:
   - Name: `site-content`
   - StorageClass: `csi-hostpath-sc`
   - AccessMode: `ReadWriteOnce`
   - Size: `12Mi`

2. Create a Pod that mounts the PVC:
   - Pod name: `nginx-site`
   - Image: `nginx:1.27`
   - Mount path: `/usr/share/nginx/html`
   - Mount the PVC as a volume

3. Expand the PVC to:
   - New size: `80Mi`

4. Record the change by saving the PVC YAML after resize to:
   - `/opt/CKA2026/resize-record.yaml`
