source ./env.sh
helm install \
    -f $HELMDIR/providers/gcp.yaml \
    --name replicator \
    --namespace operator \
    --set disableHostPort=true \
    --set replicator.enabled=true \
    $HELMDIR/confluent-operator

if true; then
    exit
fi
source retry.sh; retry 15 kubectl -n operator get sts replicators
kubectl -n operator rollout status statefulset/replicators
