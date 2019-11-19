helm install stable/prometheus --name pyoung-prometheus --namespace operator
helm install --name pyoung-grafana stable/grafana --namespace operator
kubectl get secret --namespace operator pyoung-grafana \
	-o jsonpath="{.data.admin-password}" | base64 --decode | tee grafana-passwd.txt
POD_NAME=$(kubectl get pods --namespace operator -l "app=grafana,release=pyoung-grafana" -o jsonpath="{.items[0].metadata.name}")
kubectl --namespace operator port-forward $POD_NAME 3000
