source ./env.sh
helm install \
    -f $HELMDIR/providers/gcp.yaml \
    --namespace operator \
    --set disableHostPort=true \
    --set replicator.enabled=true \
    replicator \
    $HELMDIR/confluent-operator

if true; then
    exit
fi
retry 15 kubectl -n operator get sts replicators
kubectl -n operator rollout status statefulset/replicators
