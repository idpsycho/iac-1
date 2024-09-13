

# 26.8. 14:00
- external endpoint mi dalo 34.88.158.37, ale traefik si nastavil novu ipcku ze 34.88.108.137:80
- a mam aj rezervovanu staticku ale tu ignoruje, iked som to nastavil podla navodov do configu traefik values
- namiesto toho pouziva tuto ephemeral:
```
34.88.108.137	External	europe-north1	Ephemeral	IPv4	Forwarding rule aa2416cb3ac1c48bba01a29f86a3fd0a			Premium
```
- tym padom ale na druhy den to prestane ist, lenze ja mam dns nasmerovane tam, cize je to narprd, neviem co s tym
- ale aspon tie domeny idu, len je issue ze kedze som uz x-krat to skusal tak ma to uz posiela prec, ale staci pouzit inu subdomenu.. na demosub2 mi to ide..
- a ta ipcka ma stve, lebo takto budem musiet kazdy den to fixovat, aj ked mozno bude stacit dns, ale musi tam byt riesenie..



# 26.8. rano
x- skusit dat github secrets az PO argu - bud to pojde, alebo pripraivm info ze s cim mam problem
  -> MYSLIM ZE ISLO

x- vyhodit secret, lebo sak ho mam v argocd-configu, ale overit ze ci to bude fungovat, treba matchnut secrets names asi
  ??- zvazit premenovat na argocd-config-secret
  - MYSLIM ZE ISLO

x- // clusterrole rbac pre argo este doriesime neskor
  -> VYRIESILI SME NA CALLE


- // mozme potom pozriet preco appset-components zostane outofsync napriek tomu ze sa vsetko nainstalovalo, a potrebuje refresh..
  -> POZRIET
    After reviewing the configurations, I can see the issue. The problem is in the 0-bootstrap/2-components.yaml file. The sources field is using a newer multi-source format, which might not be compatible with your current Argo CD version or configuration.
    Old (problematic) configuration:
    yamlCopyspec:
      sources:
        - repoURL: https://github.com/idpsycho/iac.git
          targetRevision: HEAD
          path: 2-component-charts
          directory:
            include: components-appset.yaml
    Change it to:
    yamlCopyspec:
      source:
        repoURL: https://github.com/idpsycho/iac.git
        targetRevision: HEAD
        path: 2-component-charts
        directory:
          include: components-appset.yaml
    The key change is replacing sources: with source: and removing the list structure. This should make the bootstrap-components Application correctly recognize and manage the appset-components ApplicationSet.
    After making this change, apply the updated 0-bootstrap/2-components.yaml file and refresh the Application in Argo CD. This should resolve the "Unable to load data" error and properly sync the ApplicationSet.


- asi nejaky problem s pravami ze asi nevie overit ci je to nainstalovane..


- poradit sa
service:
  annotations:
    cloud.google.com/load-balancer-type: "External"
    # neviem ci je lespie toto, alebo to robis cez controlplane v googli
    kubernetes.io/ingress.global-static-ip-name: "34.116.170.204"


