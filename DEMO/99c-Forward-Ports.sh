#POD_NAME=$(kubectl get pods --namespace operator -l "app=grafana,release=pyoung-grafana" -o jsonpath="{.items[0].metadata.name}")
POD_NAME=$(kubectl get pods --namespace operator -l "app.kubernetes.io/instance=pyoung-grafana,app.kubernetes.io/name=grafana" -o jsonpath="{.items[0].metadata.name}")
kubectl --namespace operator port-forward $POD_NAME 3000 &  
kubectl -n operator port-forward controlcenter-0 12345:9021 &
