
#pyoung-prometheus-prometheus-server.default.svc.cluster.local
helm install stable/prometheus --set alertmanager.persistentVolume.enabled=false --set server.persistentVolume.enabled=false --name pyoung-prometheus
POD_NAME=$(kubectl get pods --namespace default -l "app=prometheus,component=server" \
	-o jsonpath="{.items[0].metadata.name}")
kubectl --namespace default port-forward $POD_NAME 9090 &

POD_NAME=$(kubectl get pods --namespace default -l "app=prometheus,component=alertmanager" \
	-o jsonpath="{.items[0].metadata.name}")
kubectl --namespace default port-forward $POD_NAME 9093 &

POD_NAME=$(kubectl get pods --namespace default -l "app=prometheus,component=pushgateway" \
	-o jsonpath="{.items[0].metadata.name}")
kubectl --namespace default port-forward $POD_NAME 9091 &
