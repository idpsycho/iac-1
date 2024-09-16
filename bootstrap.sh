

# checkni context
kubectl config current-context

# pustaj z rootu (checkni seed/argocd/DASBOARD.md ak chces ist na dashboard)
helm upgrade --install argocd ./0a-argo-seed/argocd/chart \
  -f ./0a-argo-seed/argocd/values.yaml -n argocd-system --create-namespace

# kubectl port-forward service/argocd-server -n argocd-system 8080:443

# pristupy na github cez dev-argo ucet
kubectl apply -f ./0a-argo-seed/_secrets/github-secret.yaml

# finally, bootstrapni (nastavi sa podla configu v https://github.com/idpsycho/iac.git)
kubectl apply -f ./0b-bootstrap/2-components.yaml
kubectl apply -f ./0b-bootstrap/3-apps.yaml

# ak chces aby sa aj argo setupovalo z gitu, tak..
# kubectl apply -f ./0b-bootstrap/1-argo.yaml







# -------


# ked sa nebude rozbiehat tak
# - soft refresh, soft sync, hard refresh, a sync s prune+force+replace, nakoniec delete


# (TBD: apps, google login, seriozne projekty, gitflow, sops, migracia na prod)


# feedbacky na zapracovanie..
# - doplnil ze staci spravit:  `kubectl apply -f ./0-bootstrap/1-argo.yaml`
#   - a asi 30 sekund pockat kym sa nerozbehne ` kubectl port-forward service/argocd-server -n argocd-system 8080:443`
# - teoreticky by sa tym padom dal navod zjednodusit, ze staci mi na zaciatku spravir ten bootstrap, a same by to mohlo naskocit
# - 
# - 
