# Networking: Expose deployment via NodePort

**Goal:** Solve this scenario using `kubectl` and/or node tools (as required).

## Rules
- Treat this like the exam: minimal changes, verify results.
- Use the names given in this scenario (they may differ from common tutorials to keep the content unique).

## Task
Namespace: `itk-nodeport`

1) Fix Deployment `itk-nodeport-dep` so container port is **80/TCP** with name **http**.
2) Create Service `itk-nodeport-svc` exposing port 80/TCP and type **NodePort**.
