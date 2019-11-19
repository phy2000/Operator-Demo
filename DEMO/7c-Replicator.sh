HELMDIR=~/WORK/Operator/helm
#SETMEM="--set replicator.resources.requests.memory=1Gi"
cd $HELMDIR
helm install \
    -f ./providers/gcp.yaml \
    --name replicator \
    --namespace operator \
    --set disableHostPort=true \
    $SETMEM \
    --set replicator.enabled=true \
    ./confluent-operator

if true; then
    exit
fi
source $HELMDIR/retry.sh; retry 15 kubectl -n operator get sts replicators
kubectl -n operator rollout status statefulset/replicators
