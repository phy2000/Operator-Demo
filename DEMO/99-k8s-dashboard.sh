echo $(date) START $0
NAMESPACE=kube-system
kubectl apply --namespace $NAMESPACE -f https://raw.githubusercontent.com/kubernetes/dashboard/v1.10.1/src/deploy/recommended/kubernetes-dashboard.yaml
TOKEN=$(kubectl -n $NAMESPACE get secret  | grep tiller-token | head -1 | awk '{ print $1 }')
kubectl -n $NAMESPACE describe secrets $TOKEN | tail -1 | awk '{print $2}' | tee dashboard-token.txt
kubectl proxy &
echo browse to http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/
echo Login with the token printed above and saved in dashboard-token.txt
echo $(date) END $0
