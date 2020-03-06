source ./env.sh
helm install \
    -f $HELMDIR/providers/gcp.yaml \
    --namespace operator \
    --set disableHostPort=true \
    --set connect.enabled=true \
    connectors \
    $HELMDIR/confluent-operator

if true; then
    exit
fi
retry 15 kubectl -n operator get sts connectors
kubectl -n operator rollout status statefulset/connectors
