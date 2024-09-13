r@r-m3 iac % kubectl get ingress -n app-demosub -o jsonpath='{.items[0].status.loadBalancer.ingress[0].ip}'

35.187.33.68%                                                                        
r@r-m3 iac % kubectl describe ingress -n app-demosub
Name:             cm-acme-http-solver-wqdgr
Labels:           acme.cert-manager.io/http-domain=1237518148
                  acme.cert-manager.io/http-token=1192824530
                  acme.cert-manager.io/http01-solver=true
Namespace:        app-demosub
Address:          35.187.33.68


