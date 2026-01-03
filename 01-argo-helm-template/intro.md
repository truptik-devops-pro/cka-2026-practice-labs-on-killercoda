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
