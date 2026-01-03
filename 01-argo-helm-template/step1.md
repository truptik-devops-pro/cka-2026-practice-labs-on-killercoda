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
