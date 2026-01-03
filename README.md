<div align="center">

# 🎯 CKA 2026 Practice Labs

### *Master Kubernetes Administration with 17 Hands-On Scenarios*

[![Kubernetes](https://img.shields.io/badge/Kubernetes-326CE5?style=for-the-badge&logo=kubernetes&logoColor=white)](https://kubernetes.io/)
[![CKA](https://img.shields.io/badge/CKA-2026-FF6B6B?style=for-the-badge&logo=cncf&logoColor=white)](https://www.cncf.io/certification/cka/)
[![Killercoda](https://img.shields.io/badge/Killercoda-Ready-00D084?style=for-the-badge&logo=linux&logoColor=white)](https://killercoda.com/)
[![License](https://img.shields.io/badge/License-MIT-yellow?style=for-the-badge)](LICENSE)

<br/>

<img src="https://raw.githubusercontent.com/kubernetes/kubernetes/master/logo/logo.svg" width="120" alt="Kubernetes Logo"/>

<br/>

**Practice. Verify. Pass.**

*Exam-style scenarios designed for real cluster experience—not just reading solutions.*

---

[🚀 Quick Start](#-quick-start) •
[� Structure](#-repository-structure) •
[🎓 Study Guide](#-cka-study-strategy) •
[📚 Scenarios](#-scenario-catalog) •
[🤝 Contributing](#-contributing)

</div>

---

## ⚡ Why This Project?

<table>
<tr>
<td width="50%">

### 🔥 The Problem

❌ Most CKA prep is **theory-heavy**  
❌ No real cluster to practice on  
❌ Can't verify if your solution is correct  
❌ No feedback loop for learning  

</td>
<td width="50%">

### ✅ The Solution

✔️ **17 hands-on labs** on real clusters  
✔️ Automated verification scripts  
✔️ Exam-style time pressure practice  
✔️ Covers all 5 CKA domains  

</td>
</tr>
</table>

---

## 🎯 CKA Domain Coverage

```
┌─────────────────────────────────────────────────────────────────────┐
│                      CKA 2026 EXAM DOMAINS                          │
├─────────────────────────────────────────────────────────────────────┤
│  ████████████████████░░░░  Cluster Architecture        25%          │
│  ██████████████████░░░░░░  Workloads & Scheduling      20%          │
│  ████████████████░░░░░░░░  Services & Networking       20%          │
│  ██████████░░░░░░░░░░░░░░  Storage                     10%          │
│  ██████████████████████░░  Troubleshooting             25%          │
└─────────────────────────────────────────────────────────────────────┘
```

<div align="center">

| Domain | Labs | Coverage |
|:------:|:----:|:--------:|
| 🏗️ Cluster Architecture | 4 | ████████░░ |
| 📦 Workloads & Scheduling | 5 | ██████████ |
| 🌐 Services & Networking | 4 | ████████░░ |
| 💾 Storage | 2 | ████░░░░░░ |
| 🔧 Troubleshooting | 2 | ████░░░░░░ |

</div>

---

## 🚀 Quick Start

### Option 1: Run on Killercoda (Recommended)

```bash
# 1️⃣ Fork this repository to your GitHub account

# 2️⃣ Go to Killercoda → Creator → Repository

# 3️⃣ Add your forked repo URL

# 4️⃣ Copy the Deploy Key and add to:
#    GitHub → Repo Settings → Deploy Keys (read-only)

# 5️⃣ Start practicing! 🎉
```

### Option 2: Local Review

```bash
# Clone the repository
git clone https://github.com/truptik-devops-pro/cka-2026-practice-labs-on-killercoda.git

# Navigate to any scenario
cd 01-argo-helm-template

# Review the scenario structure
cat intro.md      # Problem statement
cat step1.md      # Tasks & hints
cat scripts/verify.sh   # Verification logic
```

---

## � Repository Structure

```
📦 cka-2026-practice-labs-on-killercoda
├── 📄 structure.json          # Killercoda course navigation
├── 📄 README.md               # You are here
│
└── 📂 01-argo-helm-template/  # Each scenario folder
    ├── 📄 index.json          # Killercoda config
    ├── 📄 intro.md            # 🎯 Problem statement
    ├── 📄 step1.md            # 📝 Tasks & hints
    ├── 📄 finish.md           # ✅ Wrap-up
    └── 📂 scripts/
        ├── 🔧 background.sh   # Auto-setup
        └── ✔️ verify.sh       # Pass/Fail check
```

---

## 🎓 CKA Study Strategy

<div align="center">

```
    ┌─────────────────────────────────────────────────────────┐
    │                  🎯 THE 5-STEP METHOD                   │
    └─────────────────────────────────────────────────────────┘
                              │
        ┌─────────────────────┼─────────────────────┐
        │                     │                     │
        ▼                     ▼                     ▼
   ┌─────────┐          ┌─────────┐          ┌─────────┐
   │  READ   │    →     │  PLAN   │    →     │ EXECUTE │
   │  intro  │          │ 30-60s  │          │ kubectl │
   └─────────┘          └─────────┘          └─────────┘
                              │
                              ▼
                        ┌─────────┐
                        │ VERIFY  │
                        │ checks  │
                        └─────────┘
                              │
                              ▼
                        ┌─────────┐
                        │ REPEAT  │
                        │ faster! │
                        └─────────┘
```

</div>

### 💡 Pro Tips

| Tip | Why It Matters |
|-----|---------------|
| ⏱️ **Time yourself** | CKA is 2 hours for 15-20 tasks |
| 📖 **Use docs.kubernetes.io** | It's allowed in the exam! |
| 🔄 **Practice verification** | Know how to prove success |
| 💪 **Repeat weak areas** | Restart scenarios until fast |
| 📝 **Build muscle memory** | Type commands, don't copy-paste |

---

## 🤝 Contributing

We welcome contributions! Here's how:

```bash
# 1️⃣ Fork & clone
git clone https://github.com/<your-username>/cka-2026-practice-labs-on-killercoda.git

# 2️⃣ Create a new scenario
mkdir 18-your-new-scenario
# Follow existing folder structure

# 3️⃣ Update structure.json

# 4️⃣ Submit a PR 🎉
```

### Contribution Guidelines

- ✅ Keep namespace/resource names consistent
- ✅ Make setup scripts idempotent (safe to re-run)
- ✅ Include verification logic where possible
- ✅ Test on Killercoda before submitting

---

## �📚 Scenario Catalog

<details>
<summary><h3>🔷 01 — Helm: Render Manifests Without CRDs</h3></summary>

| Property | Value |
|----------|-------|
| **Folder** | `01-argo-helm-template` |
| **Difficulty** | 🟢 Easy |
| **Time** | ~10 min |
| **Domain** | Workloads & Scheduling |

**What You'll Learn:**
- Helm templating fundamentals
- Rendering manifests to YAML before applying
- Controlling CRD creation during install

**Key Commands:**
```bash
helm template <release> <chart> --skip-crds
helm install --dry-run --debug
```

</details>

<details>
<summary><h3>🔷 02 — Sidecar Container with Shared Volume</h3></summary>

| Property | Value |
|----------|-------|
| **Folder** | `02-sidecar-log-tail` |
| **Difficulty** | 🟢 Easy |
| **Time** | ~10 min |
| **Domain** | Workloads & Scheduling |

**What You'll Learn:**
- Multi-container pod patterns
- Shared `emptyDir` volumes
- Log aggregation with sidecar containers

**Key Commands:**
```bash
kubectl logs <pod> -c <sidecar-container>
kubectl exec -it <pod> -c <container> -- sh
```

</details>

<details>
<summary><h3>🔷 03 — Migrate Ingress to Gateway API</h3></summary>

| Property | Value |
|----------|-------|
| **Folder** | `03-gatewayapi-migrate` |
| **Difficulty** | 🟡 Medium |
| **Time** | ~15 min |
| **Domain** | Services & Networking |

**What You'll Learn:**
- Gateway API concepts (Gateway, HTTPRoute)
- Migrating from Ingress to modern routing
- TLS listener configuration

**Key Commands:**
```bash
kubectl get gateway,httproute
kubectl describe httproute <name>
```

</details>

<details>
<summary><h3>🔷 04 — Resource Requests & Limits Calculation</h3></summary>

| Property | Value |
|----------|-------|
| **Folder** | `04-resources-fair-share` |
| **Difficulty** | 🟡 Medium |
| **Time** | ~12 min |
| **Domain** | Workloads & Scheduling |

**What You'll Learn:**
- Requests vs Limits deep dive
- Fair resource distribution across replicas
- Scheduling impact of resource specs

**Key Commands:**
```bash
kubectl describe node | grep -A5 "Allocated"
kubectl top pods
```

</details>

<details>
<summary><h3>🔷 05 — Default StorageClass Configuration</h3></summary>

| Property | Value |
|----------|-------|
| **Folder** | `05-storageclass-default` |
| **Difficulty** | 🟢 Easy |
| **Time** | ~8 min |
| **Domain** | Storage |

**What You'll Learn:**
- StorageClass creation and annotation
- `WaitForFirstConsumer` binding mode
- Setting default StorageClass

**Key Commands:**
```bash
kubectl get sc
kubectl patch storageclass <name> -p '{"metadata":{"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}'
```

</details>

<details>
<summary><h3>🔷 06 — PriorityClass Discovery & Patching</h3></summary>

| Property | Value |
|----------|-------|
| **Folder** | `06-priorityclass-patch` |
| **Difficulty** | 🟡 Medium |
| **Time** | ~12 min |
| **Domain** | Workloads & Scheduling |

**What You'll Learn:**
- PriorityClass hierarchy
- Discovering existing priority values
- Patching deployments with priority

**Key Commands:**
```bash
kubectl get priorityclass
kubectl patch deployment <name> --patch '{"spec":{"template":{"spec":{"priorityClassName":"<pc>"}}}}'
```

</details>

<details>
<summary><h3>🔷 07 — Ingress + NodePort Service Setup</h3></summary>

| Property | Value |
|----------|-------|
| **Folder** | `07-ingress-echo` |
| **Difficulty** | 🟢 Easy |
| **Time** | ~10 min |
| **Domain** | Services & Networking |

**What You'll Learn:**
- Service types and selectors
- Ingress path-based routing
- Testing from within the cluster

**Key Commands:**
```bash
kubectl expose deployment <name> --port=80
kubectl get ingress
curl -H "Host: example.com" http://<ingress-ip>
```

</details>

<details>
<summary><h3>🔷 08 — CRDs & kubectl explain</h3></summary>

| Property | Value |
|----------|-------|
| **Folder** | `08-crds-and-explain` |
| **Difficulty** | 🟢 Easy |
| **Time** | ~8 min |
| **Domain** | Cluster Architecture |

**What You'll Learn:**
- API resource discovery
- Custom Resource Definitions
- Using `kubectl explain` effectively

**Key Commands:**
```bash
kubectl api-resources | grep <crd>
kubectl explain <resource>.spec
kubectl get crd
```

</details>

<details>
<summary><h3>🔷 09 — Least-Privilege NetworkPolicy</h3></summary>

| Property | Value |
|----------|-------|
| **Folder** | `09-networkpolicy-least` |
| **Difficulty** | 🔴 Hard |
| **Time** | ~15 min |
| **Domain** | Services & Networking |

**What You'll Learn:**
- NetworkPolicy ingress/egress rules
- Namespace isolation patterns
- Default-deny policies

**Key Commands:**
```bash
kubectl get networkpolicy -A
kubectl describe networkpolicy <name>
kubectl exec -it <pod> -- wget --timeout=2 <target>
```

</details>

<details>
<summary><h3>🔷 10 — HPA with Downscale Stabilization</h3></summary>

| Property | Value |
|----------|-------|
| **Folder** | `10-hpa-stabilization` |
| **Difficulty** | 🟡 Medium |
| **Time** | ~12 min |
| **Domain** | Workloads & Scheduling |

**What You'll Learn:**
- Horizontal Pod Autoscaler configuration
- Scale-down stabilization windows
- Behavior tuning

**Key Commands:**
```bash
kubectl autoscale deployment <name> --min=2 --max=10 --cpu-percent=50
kubectl get hpa
kubectl describe hpa <name>
```

</details>

<details>
<summary><h3>🔷 11 — Install CNI Plugin</h3></summary>

| Property | Value |
|----------|-------|
| **Folder** | `11-cni-install` |
| **Difficulty** | 🟡 Medium |
| **Time** | ~10 min |
| **Domain** | Cluster Architecture |

**What You'll Learn:**
- CNI installation from manifest
- Network policy support requirements
- Verifying cluster networking

**Key Commands:**
```bash
kubectl apply -f <cni-manifest>
kubectl get pods -n kube-system | grep -E "calico|flannel|cilium"
kubectl run test --image=busybox --rm -it -- ping <pod-ip>
```

</details>

<details>
<summary><h3>🔷 12 — PVC Mount for MariaDB</h3></summary>

| Property | Value |
|----------|-------|
| **Folder** | `12-pvc-mariadb` |
| **Difficulty** | 🟡 Medium |
| **Time** | ~12 min |
| **Domain** | Storage |

**What You'll Learn:**
- PersistentVolumeClaim creation
- Volume mounts in deployments
- Data persistence verification

**Key Commands:**
```bash
kubectl get pvc,pv
kubectl exec -it <mariadb-pod> -- mysql -u root -p
```

</details>

<details>
<summary><h3>🔷 13 — cri-dockerd Installation</h3></summary>

| Property | Value |
|----------|-------|
| **Folder** | `13-cri-dockerd` |
| **Difficulty** | 🔴 Hard |
| **Time** | ~15 min |
| **Domain** | Cluster Architecture |

**What You'll Learn:**
- Container runtime installation
- Systemd service management
- Required kernel parameters

**Key Commands:**
```bash
systemctl enable --now cri-docker
sysctl net.bridge.bridge-nf-call-iptables
crictl info
```

</details>

<details>
<summary><h3>🔷 14 — Troubleshoot API Server (etcd endpoint)</h3></summary>

| Property | Value |
|----------|-------|
| **Folder** | `14-apiserver-etcd-port` |
| **Difficulty** | 🔴 Hard |
| **Time** | ~15 min |
| **Domain** | Troubleshooting |

**What You'll Learn:**
- Static pod manifest editing
- etcd client URL configuration
- Control plane troubleshooting

**Key Commands:**
```bash
cat /etc/kubernetes/manifests/kube-apiserver.yaml
crictl ps | grep apiserver
journalctl -u kubelet | tail -50
```

</details>

<details>
<summary><h3>🔷 15 — Taints & Tolerations</h3></summary>

| Property | Value |
|----------|-------|
| **Folder** | `15-taints-tolerations` |
| **Difficulty** | 🟡 Medium |
| **Time** | ~10 min |
| **Domain** | Workloads & Scheduling |

**What You'll Learn:**
- Node tainting
- Pod tolerations
- Controlled scheduling

**Key Commands:**
```bash
kubectl taint nodes <node> key=value:NoSchedule
kubectl describe node <node> | grep Taint
kubectl get pods -o wide
```

</details>

<details>
<summary><h3>🔷 16 — NodePort Service Exposure</h3></summary>

| Property | Value |
|----------|-------|
| **Folder** | `16-nodeport-expose` |
| **Difficulty** | 🟢 Easy |
| **Time** | ~8 min |
| **Domain** | Services & Networking |

**What You'll Learn:**
- Named container ports
- NodePort service creation
- Port mapping verification

**Key Commands:**
```bash
kubectl expose deployment <name> --type=NodePort --port=80 --name=<svc>
kubectl get svc <svc> -o jsonpath='{.spec.ports[0].nodePort}'
curl <node-ip>:<node-port>
```

</details>

<details>
<summary><h3>🔷 17 — Enforce TLS 1.3 Only</h3></summary>

| Property | Value |
|----------|-------|
| **Folder** | `17-tls13-only` |
| **Difficulty** | 🔴 Hard |
| **Time** | ~15 min |
| **Domain** | Cluster Architecture |

**What You'll Learn:**
- TLS version enforcement
- Ingress controller configuration
- Protocol validation testing

**Key Commands:**
```bash
curl --tlsv1.2 https://<host>  # Should FAIL
curl --tlsv1.3 https://<host>  # Should SUCCEED
openssl s_client -connect <host>:443 -tls1_3
```

</details>

---

## 📜 License

This project is licensed under the **MIT License** — see the [LICENSE](LICENSE) file for details.

---

<div align="center">

### ⭐ Found This Helpful?

**Star this repo** to keep it in your bookmarks and help others find it!

<br/>

[![GitHub stars](https://img.shields.io/github/stars/truptik-devops-pro/cka-2026-practice-labs-on-killercoda?style=social)](https://github.com/truptik-devops-pro/cka-2026-practice-labs-on-killercoda/stargazers)

<br/>

---

**Made with ❤️ for the Kubernetes community**

*Good luck on your CKA exam! 🍀*

</div>