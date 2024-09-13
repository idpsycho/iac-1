

# normalne na gcp
- regionalne (zonove je x3)
- europe-west (najlacnejsi v eu)
- nalavo v taboch sa preklikat krokmi
- zmenit 3 instancie (cena x3) na 1 instanciu
- (nechat default public cluster, inak nebude net)

- to je asi vsetko, nazov si nastavit a vytvorit, cca 5 minut pockat
- potom sa prihlasit cez gcloud nainstalovany lokalne
- cez `kubectl config current-context` sa da checknut ci sme prihlaseni na spravny cluster
- TBD: nastavit staticku ipcku (este neviem ako, nic mi neslo)
  - TMP: zatial kym neviem ako, tak riesenie je checkovat aku ip ma traefik a na to nasmerovat domenu..




# odporucam
- lens desktop appku na prijemne pozeranie klustra..





# TESTING control plane
- ked chcem zmenit external ipcku, musim vraj povolit toto ->
- najdi v settingoch: Control plane authorized networks	 Disabled
  -> edit
  -> hm, ale vyzera to byt nieco este ine, tak nejdem to este riesit...
  - idem skusit hardcodnut tu ip este raz nejako, neviem ako



# TMP3_IPS
      To force GCP to use a static IP instead of an ephemeral one for your cluster, follow these steps:

      Create a new static IP:

      Copygcloud compute addresses create my-static-ip --global

      Get the IP address:

      Copygcloud compute addresses describe my-static-ip --global

      Update your Traefik service in values.yaml:

      yamlCopyservice:
        annotations:
          kubernetes.io/ingress.global-static-ip-name: "my-static-ip"

      Apply the changes:

      Copyhelm upgrade traefik traefik/traefik -f values.yaml -n traefik-system

      Wait a few minutes, then check:

      Copykubectl get service -n traefik-system traefik

      If it doesn't change, you might need to delete and recreate the Traefik service:

      Copykubectl delete service -n traefik-system traefik
      helm upgrade traefik traefik/traefik -f values.yaml -n traefik-system
      This should force GCP to use your static IP. Remember to update your DNS records after the IP is stable.Add to Conversation

# old notes
- TBD: este by bolo dobre nastavit staticku ip, este nemam navod, ale treba to inak sa ti bude menit ipcka a prestanu ist domeny..
  - GCP "ip addresses" -> "reserve external ip addresses", europe (maybe global, ja som nedal)
  - potom nastav v cloud dns na *.domena.xx a domena.xx
  - a potom po vytvoreni treba niekde nastavit, uvidim este ze kde
    - TMP 3: neslo mi to, takze skusal ist podla navodu co pastnem dole... ako TMP3_IPS
    - TMP potencialne v traefik konfigu, ale radsej by som to vonku z kubernetu robil:
        service:
          annotations:
            cloud.google.com/load-balancer-type: "External"
            # kubernetes.io/ingress.global-static-ip-name: "34.116.170.204"
    - TMP2 druha moznost je cez "enable controlplane" v settingoch clustru v GCP, ale to necham na neskor..
      check "# control plane"
    

