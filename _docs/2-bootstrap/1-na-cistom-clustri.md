

# CHOD PODLA BOOSTRAP.SH
- sem dam asi poznamky potom este..









# ------------------------ old? -----



# co je nasetupovane
- spraveny rsekerka-dev-argo
- token s permissions na cele "repo"
- access do repa iac
- secrety su kade take po values-secrets
- TBD: pouzit sops aby mohli byt secret zakryptovane v repe, inak je to blbe davat do gitu secrety..


# co treba - 🔴🔴🔴🔴🔴🔴🔴 POZOR UZ JE NOVA VEC V BOOSTRAP.SH 🔴
- (mat helm, kubectl napojeny, lens je fajn, maj nasmerovane domenu na externu ipcku clustra)
- ! skontroluj ze si v spravnom kontexte: 🔴`kubectl config current-context`
- potreboval som nastavit argocd-rbac.yaml, iked v adamnagy-ovom rieseni to nebolo..
  🔴🔴🔴✋✋✋✋✋✋`kubectl create namespace argocd-system`
- `kubectl apply -f 1-argo-seed/_secrets/github-secret.yaml` (inak nepojde napojit sa)
- `cd bootstrap/argocd`
  - `helm upgrade --install argocd ./chart -f ./values.yaml -n argocd-system --create-namespace`
  -  `cd ../..`
  - (mozes ist na argocd/DASHBOARD.md, v zasade to co ti odporuci, pustit prikaz co vrati heslo, a spravit proxy na dashboard)

- (mozno narazis na ISSUES.md, tak checkni tam)
- `kubectl apply -f bootstrap/_rbac/clusterrole.yaml`
- (neviem ci este treba) `kubectl apply -f component-charts/argocd/argocd-rbac.yaml` (musi ist po argocd asi)
    - (keby treba zmazat, tak `kubectl delete clusterrolebinding argocd-application-controller`)

  - `cd bootstrap/argocd-config`
    - `helm upgrade --install argocd-config ./chart -f ./values.yaml -n argocd-system --create-namespace`
    - `cd ../..`

- `kubectl apply -f bootstrap/bootstrap-appset.yaml` (ma nainstalovat component-charts a app-charts)
- toto uz nevim ani co je..
  - `kubectl patch application bootstrap-appset -n argocd-system --type merge -p '{"metadata": {"annotations": {"argocd.argoproj.io/refresh": "hard"}}}'`

------
  r@r-m3 iac % kubectl apply -f app-appsets/demosub.yaml
  applicationset.argoproj.io/demosub created
  r@r-m3 iac % kubectl apply -f app-appsets/nodeapp.yaml
  applicationset.argoproj.io/nodeapp created
------
- pripadne manualne nainstalovat len cast:
  - `kubectl apply -f appsets/apps-appset.yaml` (nainstaluje app-charts)

- (ked sa to nebude rozbiehat, tak klikaj postupne soft refresh, soft sync, a potom hard refresh a hard sync mozes skusit)
  - (pod hard sync myslim prune+force+replace)


# do arga sa dostanes cez
- DASHBOARD.md



# TBD
- rozdelit to kym su s tym issues, aby som argo neredeployoval cez seba lebo si ho obcas zbytocne odpalim kvoli tomu ze menim nejaku cast..
- google login
- nasetupovat projekty..
- sops


# ISSUES
- authentican required: musis mat token tam, service account spraveny a pridany do projektu, a apply-nuti github-secret.yaml