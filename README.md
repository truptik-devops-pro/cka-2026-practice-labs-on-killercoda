# CKA 2026 Practice Labs on Killercoda (17 Scenarios)

Hands-on, exam-style Kubernetes Administrator (CKA) labs you can run directly in **Killercoda**.
Each scenario is designed to help you *practice the exact admin skills* CKA expects: build, fix, verify, and move on.

> ✅ These are **exam-style scenarios**, not “real exam questions”.
> The goal is to teach skills through realistic tasks, clear success criteria, and repeatable labs.

---

## What you get (why this repo is useful)

- **17 guided labs** aligned to core CKA domains:
  - Cluster Architecture & Configuration
  - Workloads & Scheduling
  - Services & Networking
  - Storage
  - Troubleshooting
- Each lab follows a consistent structure:
  - `intro.md` → scenario story + goal
  - `step1.md` → tasks + hints + checks
  - `scripts/background.sh` → auto-setup / reset state
  - `scripts/verify.sh` → pass/fail verification (where implemented, and growing)
- Designed for **hands-on learning**, not just reading solutions.
  You practice on an actual cluster and prove success using kubectl checks.

---

## Repo structure
structure.json          # course navigation for Killercoda
01-…/                 # scenario folders
index.json            # Killercoda scenario config
intro.md              # problem statement
step1.md              # what to do
finish.md             # wrap-up
scripts/
background.sh       # setup/reset
verify.sh           # validation (PASS/FAIL)

---

## How to use this on Killercoda (recommended)

1. Fork or clone this repo.
2. Open Killercoda → Creator → Repository.
3. Add your GitHub repository.
4. Add the **Deploy Key** shown by Killercoda into GitHub:
   - Repo → Settings → Deploy keys → Add deploy key (read-only)
5. Push updates anytime to publish changes to the labs.

---

## Scenario list (17 labs) + what you learn for CKA

### 01) Helm: Render manifests (no CRDs)
**Folder:** `01-argo-helm-template`  
**CKA skills:** Helm basics, templating, install planning, controlling CRD creation  
**You practice:** rendering output to YAML, verifying resources before applying.

### 02) Sidecar logging with shared volume
**Folder:** `02-sidecar-log-tail`  
**CKA skills:** Pod spec editing, multi-container patterns, volumes, troubleshooting logs  
**You practice:** sidecar container + shared volume + verifying logs quickly.

### 03) Ingress to Gateway API migration
**Folder:** `03-gatewayapi-migrate`  
**CKA skills:** Modern traffic routing objects, HTTPRoute/Gateway, TLS listeners  
**You practice:** translating intent (Ingress rules) into Gateway API resources.

### 04) Fair resource requests/limits with overhead
**Folder:** `04-resources-fair-share`  
**CKA skills:** requests vs limits, scheduling impact, resource calculations  
**You practice:** distributing node capacity across replicas and validating the spec.

### 05) StorageClass default + WaitForFirstConsumer
**Folder:** `05-storageclass-default`  
**CKA skills:** StorageClasses, default annotation, binding modes  
**You practice:** creating SC correctly and proving it is default.

### 06) PriorityClass from highest existing value
**Folder:** `06-priorityclass-patch`  
**CKA skills:** scheduling priority, PriorityClass discovery, patching workloads  
**You practice:** creating a new PC based on cluster state + applying to deployments.

### 07) Ingress + NodePort service (echo path)
**Folder:** `07-ingress-echo`  
**CKA skills:** Services, Ingress basics, selectors/ports, test-from-cluster  
**You practice:** wiring service + ingress and confirming HTTP behavior.

### 08) CRDs list + kubectl explain extraction
**Folder:** `08-crds-and-explain`  
**CKA skills:** API discovery, CRDs, `kubectl explain`, resource schema understanding  
**You practice:** extracting correct field docs and validating API resources exist.

### 09) Least-permissive NetworkPolicy
**Folder:** `09-networkpolicy-least`  
**CKA skills:** NetworkPolicy rules, namespace isolation, traffic allow-lists  
**You practice:** allowing only what’s needed, blocking everything else, proving it.

### 10) HPA with downscale stabilization
**Folder:** `10-hpa-stabilization`  
**CKA skills:** autoscaling, HPA config, behavior tuning  
**You practice:** creating HPA with correct limits + validating scaling behavior.

### 11) Install CNI (policy-capable)
**Folder:** `11-cni-install`  
**CKA skills:** cluster networking foundation, CNI enablement, policy readiness  
**You practice:** applying a CNI manifest and verifying cluster networking works.

### 12) PVC + mount into MariaDB
**Folder:** `12-pvc-mariadb`  
**CKA skills:** PVC/PV usage, deployments + volume mounts, persistence checks  
**You practice:** provisioning storage and validating data persistence.

### 13) Install & enable cri-dockerd + sysctl
**Folder:** `13-cri-dockerd`  
**CKA skills:** runtime plumbing, node config basics, system services  
**You practice:** runtime install/enable and confirming required kernel params.

### 14) Troubleshoot kube-apiserver etcd endpoint
**Folder:** `14-apiserver-etcd-port`  
**CKA skills:** control-plane troubleshooting, static pod manifests, etcd client URL  
**You practice:** diagnosing why API is down and fixing config safely.

### 15) Taints & tolerations
**Folder:** `15-taints-tolerations`  
**CKA skills:** node taints, tolerations, controlled scheduling  
**You practice:** tainting nodes and forcing a pod to land there (and proving it).

### 16) Expose deployment via NodePort (port 80 named http)
**Folder:** `16-nodeport-expose`  
**CKA skills:** Service wiring, container ports, named ports, NodePort correctness  
**You practice:** fixing ports + creating NodePort and verifying the mapping.

### 17) Enforce TLSv1.3 only + validate with curl
**Folder:** `17-tls13-only`  
**CKA skills:** TLS policy, ingress/controller config patterns, validation testing  
**You practice:** restricting protocol versions and proving TLS1.2 fails / TLS1.3 succeeds.

---

## What’s “best” about this project (your differentiators)

- **Hands-on-first:** every topic is a lab, not a PDF dump.
- **Verification mindset:** learn to prove success using kubectl checks.
- **Repeatable practice:** restart scenarios and build exam speed.
- **Topic coverage:** networking + storage + troubleshooting (where CKA time is usually lost).

---

## Suggested practice method (CKA-friendly)

For each scenario:
1. Read the goal (intro)
2. Plan your commands (30–60 seconds)
3. Implement
4. Verify using `kubectl get/describe/logs` and the scenario checks
5. Restart and repeat faster

---

## Contributing / extending

Want to add more scenarios or improve verification scripts?
- Add a new folder like `18-.../`
- Update `structure.json`
- Keep naming consistent (namespaces + resources)
- Prefer **idempotent** setup scripts (safe to re-run)

PRs welcome.

---

## License
Choose one:
- MIT (most open)
- Apache-2.0 (common for tooling)