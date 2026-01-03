## Tasks
1. Identify nodes with label `disk=ssd`
2. Create Pod `nginx-kusc01801` with image `nginx:1.27`
3. Add nodeSelector `disk: ssd` to schedule on SSD nodes

## Suggested commands
```bash
# Check which nodes have the label
kubectl get nodes --show-labels | grep disk=ssd

# Create the Pod with nodeSelector
cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Pod
metadata:
  name: nginx-kusc01801
spec:
  nodeSelector:
    disk: ssd
  containers:
  - name: nginx
    image: nginx:1.27
EOF
```

## Verify
```bash
kubectl get nodes --show-labels | grep disk=ssd
kubectl get pod nginx-kusc01801 -o wide
kubectl get pod nginx-kusc01801 -o jsonpath='{.spec.nodeSelector}'; echo
```
