source ./env.sh
#SETMEM="--set controlcenter.resources.requests.memory=1Gi"
cd $HELMDIR
helm install \
    -f ./providers/gcp.yaml \
    --name controlcenter \
    --namespace operator \
    --set disableHostPort=true \
    $SETMEM \
    --set controlcenter.enabled=true \
    ./confluent-operator

if true; then
    exit
fi
source $HELMDIR/retry.sh; retry 15 kubectl -n operator get sts controlcenter
kubectl -n operator rollout status statefulset/controlcenter
