source ./env.sh
helm install \
    -f $HELMDIR/providers/gcp.yaml \
    --name connectors \
    --namespace operator \
    --set disableHostPort=true \
    --set connect.enabled=true \
    $HELMDIR/confluent-operator

if true; then
    exit
fi
source retry.sh; retry 15 kubectl -n operator get sts connectors
kubectl -n operator rollout status statefulset/connectors
