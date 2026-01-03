#!/usr/bin/env bash
set -euo pipefail

# Run this from the repo root (where structure.json exists)

# -------------------------
# Q01
# -------------------------
cat > 01-argo-helm-template/intro.md <<'EOF'
# 01: Argo CD Helm Template (CRDs already installed)

## Goal
Generate Argo CD manifests using Helm **without installing CRDs** (CRDs are pre-installed).

## Requirements
- Add Helm repo name: `argocd-repo`
- Render chart version: **7.6.8**
- Namespace: `gitops`
- Save output to: `/home/candidate/argocd-manifest.yaml`

## Constraints
- Do not apply/install to the cluster.
- Output must not contain any `CustomResourceDefinition`.
EOF

cat > 01-argo-helm-template/step1.md <<'EOF'
## Tasks
1) Add the official Argo CD Helm repository with name `argocd-repo`
2) Generate a Helm template from chart `argo/argo-cd` **version 7.6.8** into namespace `gitops`
3) Ensure CRDs are not included in output (CRDs are pre-installed)
4) Save output YAML to: `/home/candidate/argocd-manifest.yaml`

## Suggested commands
```bash
helm repo add argocd-repo https://argoproj.github.io/argo-helm
helm repo update

helm template argocd argocd-repo/argo-cd \
  --version 7.6.8 \
  --namespace gitops \
  --skip-crds \
  > /home/candidate/argocd-manifest.yaml
```

If needed, you may also use chart values such as `--set crds.install=false` as long as CRDs are not rendered.

## Verify
```bash
ls -lh /home/candidate/argocd-manifest.yaml
grep -n '^kind: CustomResourceDefinition' /home/candidate/argocd-manifest.yaml && echo "❌ CRDs found" || echo "✅ No CRDs"
```
EOF

# -------------------------
# Q02
# -------------------------
cat > 02-sidecar-log-tail/intro.md <<'EOF'
# 02: Sidecar Container (log-reader)

## Goal
Update the `webapp` Deployment by adding a sidecar container that tails an application log file from a shared volume.

## Requirements
- Deployment: `webapp`
- Sidecar name: `log-reader`
- Sidecar image: `busybox:1.36`
- Command: `/bin/sh -c "tail -f /var/log/application.log"`
- Use a volume mounted at `/var/log` in both containers
EOF

cat > 02-sidecar-log-tail/step1.md <<'EOF'
## Tasks
1. Edit Deployment `webapp` to add a sidecar container `log-reader`
2. Mount a shared volume at `/var/log` in both containers
3. Sidecar runs: `/bin/sh -c "tail -f /var/log/application.log"`

## Verify
```bash
kubectl rollout status deploy/webapp
kubectl get pod -l app=webapp -o jsonpath='{.items[0].spec.containers[*].name}'; echo
kubectl logs deploy/webapp -c log-reader --tail=20
```
EOF

# -------------------------
# Q03
# -------------------------
cat > 03-gatewayapi-migrate/intro.md <<'EOF'
# 03: Gateway API Migration (Ingress -> Gateway/HTTPRoute)

## Goal
Migrate the existing Ingress `api-ingress` to Gateway API resources while keeping HTTPS/TLS behavior and routing rules.

## Note
GatewayClass `nginx-gateway` already exists.
EOF

cat > 03-gatewayapi-migrate/step1.md <<'EOF'
## Tasks
1. Inspect existing Ingress `api-ingress` to capture:
   - host
   - tls secret
   - backend service + port
   - paths/rules

2. Create Gateway:
   - name: `api-gateway`
   - hostname: `api.demo.k8s.local`
   - GatewayClass: `nginx-gateway`
   - HTTPS listener using same TLS secret as Ingress

3. Create HTTPRoute:
   - name: `api-route`
   - hostname: `api.demo.k8s.local`
   - attach to `api-gateway` using parentRefs
   - same routing rules as Ingress

## Verify
```bash
kubectl get gateway,httproute -A
kubectl describe gateway api-gateway
kubectl describe httproute api-route
```
EOF

# -------------------------
# Q04 (fixed: scale to 1, not 0)
# -------------------------
cat > 04-resources-fair-share/intro.md <<'EOF'
# 04: Resource Management (fair requests/limits + overhead)

## Goal
Adjust Pod requests/limits for stable operation and evenly distribute resources across 3 Pods.

## Requirements
- Deployment: `webapp-deployment`
- Scale down to 1 for editing, then scale back to 3
- Equal CPU/memory requests & limits per Pod
- Add overhead (recommended 10% headroom)
- Init containers and main containers must have the same requests/limits
EOF

cat > 04-resources-fair-share/step1.md <<'EOF'
## Tasks
1. Scale deployment to 1 replica:
```bash
kubectl scale deploy webapp-deployment --replicas=1
```

2. Calculate fair per-pod resources for 3 replicas using node allocatable, minus existing requests, with overhead (ex: 10%).

3. Edit the deployment:
   - apply the same requests/limits to initContainers and containers

4. Scale back to 3:
```bash
kubectl scale deploy webapp-deployment --replicas=3
kubectl rollout status deploy/webapp-deployment
```

## Verify
```bash
kubectl get pods -l app=webapp
kubectl describe pod <pod> | egrep -A6 "Requests|Limits"
```
EOF

# -------------------------
# Q05
# -------------------------
cat > 05-storageclass-default/intro.md <<'EOF'
# 05: StorageClass Configuration (default + WFFC)

## Goal
Create a default StorageClass for local-path provisioning.

## Requirements
- StorageClass: `local-storage`
- provisioner: `rancher.io/local-path`
- volumeBindingMode: `WaitForFirstConsumer`
- set as default
- do not modify existing Deployments or PVCs
EOF

cat > 05-storageclass-default/step1.md <<'EOF'
## Tasks
Create the StorageClass `local-storage` with:
- default annotation: `storageclass.kubernetes.io/is-default-class: "true"`
- provisioner: `rancher.io/local-path`
- volumeBindingMode: `WaitForFirstConsumer`

## Verify
```bash
kubectl get sc local-storage -o yaml
kubectl get sc local-storage -o jsonpath='{.metadata.annotations.storageclass\.kubernetes\.io/is-default-class}'; echo
kubectl get sc local-storage -o jsonpath='{.volumeBindingMode}'; echo
```
EOF

# -------------------------
# Q06
# -------------------------
cat > 06-priorityclass-patch/intro.md <<'EOF'
# 06: PriorityClass (highest - 1) + patch deployment

## Goal
Create a PriorityClass with value = (highest user-defined PriorityClass - 1) and patch a deployment to use it.

## Requirements
- Namespace: `production`
- Deployment: `logger-app`
- New PriorityClass: `critical-priority`
EOF

cat > 06-priorityclass-patch/step1.md <<'EOF'
## Tasks
1. Find the highest existing user-defined PriorityClass value:
```bash
kubectl get priorityclass -o wide
```

2. Create PriorityClass `critical-priority` with value (highest - 1)

3. Patch deployment `logger-app` in namespace `production` to use:
   - priorityClassName: `critical-priority`

## Verify
```bash
kubectl get priorityclass critical-priority
kubectl get deploy logger-app -n production -o jsonpath='{.spec.template.spec.priorityClassName}'; echo
```
EOF

# -------------------------
# Q07 (fixed: needs service + ingress)
# -------------------------
cat > 07-ingress-echo/intro.md <<'EOF'
# 07: Ingress Resource (host/path routing)

## Goal
Expose an application via Ingress and confirm HTTP 200.

## Requirements
- Namespace: `demo-app`
- Ingress: `app-ingress`
- Service: `app-service` (ClusterIP) on port 8090
- Host: `demo.example.com`
- Path: `/api`
EOF

cat > 07-ingress-echo/step1.md <<'EOF'
## Tasks
1. Create Service `app-service` (type ClusterIP) on port 8090 targeting the app pods.
2. Create Ingress `app-ingress`:
   - host: `demo.example.com`
   - path: `/api`
   - backend: `app-service:8090`

## Verify
```bash
kubectl -n demo-app get ing,svc
curl -o /dev/null -s -w "%{http_code}\n" http://demo.example.com/api
```
EOF

# -------------------------
# Q08
# -------------------------
cat > 08-crds-and-explain/intro.md <<'EOF'
# 08: CRDs (Istio) + kubectl explain

## Goal
Practice CRD discovery and schema documentation extraction using kubectl.

## Requirements
1. List all Istio CRDs and save to `~/crds-list.yaml` using default kubectl output.
2. Extract documentation for `VirtualService.spec.hosts` and save to `~/hosts-spec.yaml`.
EOF

cat > 08-crds-and-explain/step1.md <<'EOF'
## Tasks
1. List Istio CRDs (default output):
```bash
kubectl get crd | grep istio.io > ~/crds-list.yaml
```

2. Explain VirtualService hosts field:
```bash
kubectl explain virtualservice.spec.hosts > ~/hosts-spec.yaml
# If needed (fully-qualified):
kubectl explain virtualservice.networking.istio.io.spec.hosts > ~/hosts-spec.yaml
```

## Verify
```bash
ls -lh ~/crds-list.yaml ~/hosts-spec.yaml
head -n 20 ~/crds-list.yaml
head -n 40 ~/hosts-spec.yaml
```
EOF

# -------------------------
# Q09
# -------------------------
cat > 09-networkpolicy-least/intro.md <<'EOF'
# 09: NetworkPolicy (least permissive)

## Goal
Allow traffic from frontend to backend while keeping policy least permissive.

## Given
- `frontend-app` in namespace `frontend`
- `backend-api` in namespace `backend`
EOF

cat > 09-networkpolicy-least/step1.md <<'EOF'
## Tasks
Create a NetworkPolicy that allows only the required interaction:
- allow ingress to backend only from frontend
- restrict to required port(s) if known
- keep everything else blocked (least permissive)

## Verify
```bash
kubectl get netpol -A
kubectl -n backend describe netpol <policy-name>
```
EOF

# -------------------------
# Q10
# -------------------------
cat > 10-hpa-stabilization/intro.md <<'EOF'
# 10: HPA (CPU 60%, 2-6 pods, downscale 45s)

## Goal
Create an HPA for nginx with stable downscaling behavior.

## Requirements
- Namespace: `scaling`
- HPA: `nginx-scaler`
- Target deployment: `nginx-deployment`
- CPU target: 60%
- minReplicas: 2
- maxReplicas: 6
- downscale stabilization window: 45s
EOF

cat > 10-hpa-stabilization/step1.md <<'EOF'
## Tasks
Create `autoscaling/v2` HPA `nginx-scaler` targeting `nginx-deployment` with:
- 60% CPU target
- min 2, max 6
- scaleDown stabilizationWindowSeconds: 45

## Verify
```bash
kubectl -n scaling get hpa
kubectl -n scaling describe hpa nginx-scaler
kubectl -n scaling get hpa nginx-scaler -o yaml | sed -n '/behavior:/,/metrics:/p'
```
EOF

# -------------------------
# Q11 (fixed: Calico only to guarantee NetworkPolicy)
# -------------------------
cat > 11-cni-install/intro.md <<'EOF'
# 11: CNI Installation (NetworkPolicy support required)

## Goal
Install a CNI that enables pod networking and supports NetworkPolicy enforcement.

## Requirement
- Install Calico from manifest (NetworkPolicy enforcement required).
EOF

cat > 11-cni-install/step1.md <<'EOF'
## Tasks
Install Calico (v3.27.4) using the manifest:
```bash
kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.27.4/manifests/tigera-operator.yaml
```

## Verify
```bash
kubectl get pods -A | grep -E 'calico|tigera' || true
kubectl get nodes
```
EOF

# -------------------------
# Q12
# -------------------------
cat > 12-pvc-mariadb/intro.md <<'EOF'
# 12: PVC + update deployment manifest

## Goal
Claim an existing retained PV with a PVC and update a deployment to use it.

## Requirements
- Namespace: `database`
- PVC: `database-storage`
- RWO, 500Mi
- Update `/opt/database.yaml` to use the PVC
EOF

cat > 12-pvc-mariadb/step1.md <<'EOF'
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
EOF

# -------------------------
# Q13
# -------------------------
cat > 13-cri-dockerd/intro.md <<'EOF'
# 13: cri-dockerd + sysctl tuning

## Goal
Install cri-dockerd, enable the service, and apply required sysctl settings.

## Requirements
- Install: `~/cri-dockerd_0.3.15.3-0.ubuntu-jammy_amd64.deb`
- Enable/start: `cri-docker`
- sysctl values:
  - `net.bridge.bridge-nf-call-iptables=1`
  - `net.ipv6.conf.all.forwarding=1`
  - `net.ipv4.ip_forward=1`
  - `net.netfilter.nf_conntrack_max=262144`
EOF

cat > 13-cri-dockerd/step1.md <<'EOF'
## Tasks
1. Install package via dpkg
2. Enable/start `cri-docker` service
3. Apply sysctl values and persist them

## Verify
```bash
dpkg -l | grep cri-dockerd
systemctl is-active cri-docker
sysctl net.bridge.bridge-nf-call-iptables net.ipv6.conf.all.forwarding net.ipv4.ip_forward net.netfilter.nf_conntrack_max
```
EOF

# -------------------------
# Q14
# -------------------------
cat > 14-apiserver-etcd-port/intro.md <<'EOF'
# 14: Troubleshooting - kube-apiserver cannot connect to etcd

## Scenario
After migration, kube-apiserver points to etcd peer port 2380 instead of client port 2379.

## Goal
Fix kube-apiserver etcd endpoint to use port 2379.
EOF

cat > 14-apiserver-etcd-port/step1.md <<'EOF'
## Tasks
1. Inspect kube-apiserver static pod manifest:
   - `/etc/kubernetes/manifests/kube-apiserver.yaml`

2. Find `--etcd-servers=...:2380` and correct it to `:2379`

3. Save and wait for kubelet to restart static pod

## Verify
```bash
kubectl get nodes
kubectl -n kube-system get pods | grep kube-apiserver || true
```
EOF

# -------------------------
# Q15 (fixed: Effect not Type)
# -------------------------
cat > 15-taints-tolerations/intro.md <<'EOF'
# 15: Taints & Tolerations

## Goal
Reserve a node so normal pods can't schedule, then schedule a pod with toleration on that node.

## Requirements
- Node: `worker-node01`
- Taint: key=`Env`, value=`Production`, effect=`NoSchedule`
- Pod name: `prod-pod` must land on `worker-node01`
EOF

cat > 15-taints-tolerations/step1.md <<'EOF'
## Tasks
1. Taint node:
```bash
kubectl taint node worker-node01 Env=Production:NoSchedule
```

2. Create pod `prod-pod` with toleration for:
   - key `Env`
   - value `Production`
   - effect `NoSchedule`

Ensure it lands on `worker-node01` (use nodeName if needed).

## Verify
```bash
kubectl describe node worker-node01 | sed -n '/Taints:/,/Unschedulable:/p'
kubectl get pod prod-pod -o wide
```
EOF

# -------------------------
# Q16
# -------------------------
cat > 16-nodeport-expose/intro.md <<'EOF'
# 16: NodePort Service Exposure

## Goal
Expose a deployment using NodePort on port 8080/TCP.

## Requirements
- Namespace: `services`
- Deployment: `service-deployment`
- Container port: 8080/TCP named `http`
- Service: `service-nodeport` type NodePort exposing 8080/TCP
EOF

cat > 16-nodeport-expose/step1.md <<'EOF'
## Tasks
1. Update deployment `service-deployment` to expose container port:
   - port 8080
   - protocol TCP
   - name `http`

2. Create NodePort service `service-nodeport` exposing port 8080/TCP.

## Verify
```bash
kubectl -n services get deploy,svc
kubectl -n services describe svc service-nodeport
```
EOF

# -------------------------
# Q17
# -------------------------
cat > 17-tls13-only/intro.md <<'EOF'
# 17: TLS Hardening (TLSv1.3 only)

## Goal
Restrict TLS to TLSv1.3 only and validate with curl.

## Requirements
- Namespace: `web`
- Deployment: `web-server`
- Service: `web-service`
- Hostname in `/etc/hosts`: `secure.demo.local`
- TLSv1.2 must fail; TLSv1.3 must succeed
EOF

cat > 17-tls13-only/step1.md <<'EOF'
## Tasks
1. Edit the existing ConfigMap used by `web-server` to allow only TLSv1.3.
2. Add service IP to `/etc/hosts` as `secure.demo.local`
3. Validate:
```bash
curl --tls-max 1.2 https://secure.demo.local -k  # should fail
curl --tlsv1.3 https://secure.demo.local -k      # should work
```

## Verify helpers
```bash
SVC_IP=$(kubectl -n web get svc web-service -o jsonpath='{.spec.clusterIP}')
echo "$SVC_IP secure.demo.local" | sudo tee -a /etc/hosts
tail -n 3 /etc/hosts
```
EOF

echo "✅ Updated intro.md and step1.md for all 17 scenarios."
