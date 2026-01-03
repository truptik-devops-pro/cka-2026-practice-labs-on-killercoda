# Storage: Create default StorageClass (WFFC)

**Goal:** Solve this scenario using `kubectl` and/or node tools (as required).

## Rules
- Treat this like the exam: minimal changes, verify results.
- Use the names given in this scenario (they may differ from common tutorials to keep the content unique).

## Task
Create a StorageClass named **itk-local** using provisioner `rancher.io/local-path`, set `volumeBindingMode: WaitForFirstConsumer`, and mark it as the **default** StorageClass.
