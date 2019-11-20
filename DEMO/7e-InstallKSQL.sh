source ./env.sh
#SETMEM="--set ksql.resources.requests.memory=1Gi"
cd $HELMDIR
helm install \
    -f ./providers/gcp.yaml \
    --name ksql \
    --namespace operator \
    --set disableHostPort=true \
    $SETMEM \
    --set ksql.enabled=true \
    ./confluent-operator

if true; then
    exit
fi
source $HELMDIR/retry.sh; retry 15 kubectl -n operator get sts ksql
kubectl -n operator rollout status statefulset/ksql
