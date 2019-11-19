source ./env.sh
#MEMREQ="--set connect.resources.requests.memory=1Gi"
cd $HELMDIR
helm install \
    -f ./providers/gcp.yaml \
    --name connectors \
    --namespace operator \
    --set disableHostPort=true \
    --set connect.enabled=true \
    $MEMREQ \
    ./confluent-operator

if true; then
    exit
fi
source $HELMDIR/retry.sh; retry 15 kubectl -n operator get sts connectors
kubectl -n operator rollout status statefulset/connectors
