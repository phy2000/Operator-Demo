#POD_NAME=$(kubectl get pods --namespace operator -l "app=grafana,release=pyoung-grafana" -o jsonpath="{.items[0].metadata.name}")
POD_NAME=$(kubectl get pods --namespace operator -l "app.kubernetes.io/instance=pyoung-grafana,app.kubernetes.io/name=grafana" -o jsonpath="{.items[0].metadata.name}")
kubectl --namespace operator port-forward $POD_NAME 3000 &  
kubectl -n operator port-forward controlcenter-0 12345:9021 &

echo connect to control center at "localhost:12345"
echo use admin/Developer1 to login

echo connect to grafana at "localhost:3000"
echo login with user "admin" and the password saved in "grafana-passwd.txt"
