source ./env.sh
helm install \
    -f $HELMDIR/providers/gcp.yaml \
    --name ksql \
    --namespace operator \
    --set disableHostPort=true \
    --set ksql.enabled=true \
    $HELMDIR/confluent-operator

if true; then
    exit
fi
source retry.sh; retry 15 kubectl -n operator get sts ksql
kubectl -n operator rollout status statefulset/ksql
