source ./env.sh
helm install \
    -f $HELMDIR/providers/gcp.yaml \
    --namespace operator \
    --set disableHostPort=true \
    --set ksql.enabled=true \
    ksql \
    $HELMDIR/confluent-operator

if true; then
    exit
fi
source retry.sh; retry 15 kubectl -n operator get sts ksql
kubectl -n operator rollout status statefulset/ksql
