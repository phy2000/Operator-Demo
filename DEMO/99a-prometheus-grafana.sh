# In helm 3.x the stable repos must be added explicitly (for now)
helm repo add stable https://kubernetes-charts.storage.googleapis.com
helm repo update

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
