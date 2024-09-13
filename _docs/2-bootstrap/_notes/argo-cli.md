
# toto je fajn ze rovno hodi chybu a netreba dohladavat

r@r-m3 iac % argocd app sync bootstrap-appset --prune

  Name:               argocd-system/bootstrap-appset
  Project:            default
  Server:             https://kubernetes.default.svc
  Namespace:          argocd-system
  URL:                https://argo.iis-dev.net/applications/bootstrap-appset
  Source:
  - Repo:             https://github.com/idpsycho/iac.git
    Target:           HEAD
    Path:             .
  SyncWindow:         Sync Allowed
  Sync Policy:        Automated (Prune)
  Sync Status:        Unknown
  Health Status:      Healthy

  Operation:          Sync
  Sync Revision:      
  Phase:              Error
  Start:              2024-08-24 09:22:57 +0200 CEST
  Finished:           2024-08-24 09:22:57 +0200 CEST
  Duration:           0s
  Message:            ComparisonError: rpc error: code = Unknown desc = Manifest generation error (cached): rpc error: code = FailedPrecondition desc = Failed to unmarshal "deployment.yaml": <nil>
  FATA[0001] Operation has completed with phase: Error   




# potom v DASHBOARD.md je ze ako sa setupuje argo cli



