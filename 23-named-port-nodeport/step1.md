## Tasks
1. Edit Deployment `ui-frontend` in namespace `portal`
2. Add container port spec with name `http`, containerPort `80`, protocol `TCP`
3. Create NodePort Service `ui-frontend-svc` targeting port name `http`

## Suggested commands
```bash
# Edit deployment to add port
kubectl -n portal edit deploy ui-frontend
# Add under containers[].ports:
#   - name: http
#     containerPort: 80
#     protocol: TCP

# Create NodePort service
cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Service
metadata:
  name: ui-frontend-svc
  namespace: portal
spec:
  type: NodePort
  selector:
    app: ui-frontend
  ports:
  - port: 80
    targetPort: http
    protocol: TCP
EOF
```

## Verify
```bash
kubectl -n portal get deploy ui-frontend -o jsonpath='{.spec.template.spec.containers[0].ports}'; echo
kubectl -n portal get svc ui-frontend-svc -o wide
kubectl -n portal describe svc ui-frontend-svc | egrep -i "Type:|NodePort|TargetPort"
```
