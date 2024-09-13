
# ked nechce dlho terminatnut namespace
- tak existuje force
  `kubectl delete namespace __NAMESPACE__ --grace-period=0 --force`
  `kubectl delete namespace argocd-system --grace-period=0 --force`

- a potom este druha uroven ktora "removes finalizers"
  `kubectl get namespace __NAMESPACE__ -o json | jq '.spec.finalizers = []' | kubectl replace --raw "/api/v1/namespaces/__NAMESPACE__/finalize" -f -`
  `kubectl get namespace argocd-system -o json | jq '.spec.finalizers = []' | kubectl replace --raw "/api/v1/namespaces/argocd-system/finalize" -f -`

