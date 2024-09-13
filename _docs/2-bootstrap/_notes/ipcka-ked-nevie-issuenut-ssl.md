
# zistit aka ip sa pouziva
  `dig demosub2.iis-dev.net`

# toto skusi acme (ten key moze byt iny..)
  r@r-m3 iac %
  curl -v http://demosub2.iis-dev.net/.well-known/acme-challenge/MVLmjlJU8z64tEvg9t4Xin4TgUFYdGuHTjq9lFsrs6Q
  * Host demosub2.iis-dev.net:80 was resolved.
  * IPv6: (none)
  * IPv4: 34.116.170.204
  *   Trying 34.116.170.204:80...

  - toto ked nejde, tak je problem asi..


# takto si vytiahnes ze co pouziva napr app-demosub2
    kubectl get ingress -n app-demosub2 -o yaml | grep -A 3 status
    
      status:
        loadBalancer:
          ingress:
          - ip: 34.118.55.206
    --
      status:
        loadBalancer:
          ingress:
          - ip: 34.118.55.206


