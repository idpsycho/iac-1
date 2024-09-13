
# potom sa tam dostanes cez
  - checkni DASHBOARD.md
  `kubectl port-forward service/argocd-server -n argocd-system 8080:443`
  -> http://localhost:8080/

  login: admin
  heslo odporucilo po nainstalovani ze:
  `kubectl -n argocd-system get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d`
  pozor skopiruj si to heslo opatrne, a bez toho percenta na konci, najprv mi to neslo ale opatrne hej




# ked tak takto sa da resetnut heslo..
  Generate a new password:
    NEW_PASSWORD=$(openssl rand -base64 15)

  Hash the new password:
    BCRYPT_HASH=$(htpasswd -bnBC 10 "" $NEW_PASSWORD | tr -d ':\n' | sed 's/$2y/$2a/')

  Update the secret:
    kubectl -n argocd-system patch secret argocd-secret \
      -p "{\"stringData\": {\"admin.password\": \"$BCRYPT_HASH\", \"admin.passwordMtime\": \"$(date +%FT%T%Z)\"}}"

  Restart the ArgoCD server:
    kubectl -n argocd-system rollout restart deployment argocd-server

    echo $NEW_PASSWORD


# TBD ze ako to spristupnit zvonka, ale securely..



# keby chces robit s argo cli
- nainstaluje cez brew, a..
```
r@r-m3 iac % argocd app sync bootstrap-appset --prune
  FATA[0000] Argo CD server address unspecified           

r@r-m3 iac % 
  `kubectl -n argocd-system get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d`

r@r-m3 iac % argocd login localhost:8080
  WARNING: server is not configured with TLS. Proceed (y/n)? y
  Username: admin
  Password: 
  'admin:login' logged in successfully
  Context 'localhost:8080' updated
```
