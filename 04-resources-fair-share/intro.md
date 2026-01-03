## Goal
Adjust Pod requests/limits for stable operation and evenly distribute resources across 3 Pods.

## Requirements
- Deployment: `webapp-deployment`
- Scale down to 1 for editing, then scale back to 3
- Equal CPU/memory requests & limits per Pod
- Add overhead (recommended 10% headroom)
- Init containers and main containers must have the same requests/limits
