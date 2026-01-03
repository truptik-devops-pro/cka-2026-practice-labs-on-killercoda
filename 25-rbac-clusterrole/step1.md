## Tasks
1. Create ClusterRole `pipeline-deployer` with `create` permission on Deployments, StatefulSets, DaemonSets (apps API group)
2. Create ServiceAccount `cicd-bot` in namespace `app-squad`
3. Create RoleBinding `pipeline-deployer-binding` in `app-squad` binding ClusterRole to ServiceAccount

## Suggested commands
```bash
# Create namespace
kubectl create namespace app-squad

# Create ClusterRole
cat <<EOF | kubectl apply -f -
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: pipeline-deployer
rules:
- apiGroups: ["apps"]
  resources: ["deployments", "statefulsets", "daemonsets"]
  verbs: ["create"]
EOF

# Create ServiceAccount
kubectl -n app-squad create serviceaccount cicd-bot

# Create RoleBinding (namespace-scoped)
cat <<EOF | kubectl apply -f -
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: pipeline-deployer-binding
  namespace: app-squad
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: pipeline-deployer
subjects:
- kind: ServiceAccount
  name: cicd-bot
  namespace: app-squad
EOF
```

## Verify
```bash
kubectl get clusterrole pipeline-deployer
kubectl -n app-squad get sa cicd-bot
kubectl -n app-squad get rolebinding pipeline-deployer-binding -o yaml

# Test permissions
kubectl auth can-i create deployments \
  --as=system:serviceaccount:app-squad:cicd-bot -n app-squad
# Expected: yes

kubectl auth can-i create deployments \
  --as=system:serviceaccount:app-squad:cicd-bot -n default
# Expected: no
```
