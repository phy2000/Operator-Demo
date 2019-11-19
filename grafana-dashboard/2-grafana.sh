helm install stable/grafana --name pyoung-grafana
kubectl get secret --namespace default pyoung-grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo

 POD_NAME=$(kubectl get pods --namespace default -l "app=grafana,release=pyoung-grafana" -o jsonpath="{.items[0].metadata.name}")
 kubectl --namespace default port-forward $POD_NAME 3000 &
