helm install \
	--namespace operator \
	pyoung-prometheus \
	stable/prometheus 
helm install \
	--namespace operator \
	pyoung-grafana \
	stable/grafana 
kubectl get secret --namespace operator pyoung-grafana \
	-o jsonpath="{.data.admin-password}" | base64 --decode | tee grafana-passwd.txt
POD_NAME=$(kubectl get pods --namespace operator -l "app=grafana,release=pyoung-grafana" -o jsonpath="{.items[0].metadata.name}")
