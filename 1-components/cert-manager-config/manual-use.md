

# install
- and also install (with argo components/ or manually) the cert-manager component chart and cert-manager-config component chart
  `cd components/cert-manager && sh manual-run.sh`
  `cd components/cert-manager-config && sh manual-run.sh`


# how is it used
- in `apps(deployments-charts)/APPNAME/chart/templates/ingress.yaml` you need:

```
spec:
  ingressClassName: {{ .Values.ingress.className }}
  tls:
    - hosts:
        - {{ $host }}
      secretName: {{ $host }}-tls

ingress:
  host: demosub.iis-dev.net
  domain: iis-dev.net
  className: traefik
  annotations:
    cert-manager.io/cluster-issuer: http-cert-issuer
```


# note
- values.yaml je prazdny, aby bol jednotny prikaz na secko


# ako checknut logy ci to uspelo?
- akoze v prvom rade mozes skusit https, ale inak nevim..
- potom cert-manager-123 pod logy
- (potom ked tak treafik logy)
