echo ""
echo "http://localhost:8080"
echo ""
kubectl port-forward service/argocd-server -n argocd-system 8080:443
