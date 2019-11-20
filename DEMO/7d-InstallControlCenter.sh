source ./env.sh
helm install \
    -f $HELMDIR/providers/gcp.yaml \
    --name controlcenter \
    --namespace operator \
    --set disableHostPort=true \
    --set controlcenter.enabled=true \
    $HELMDIR/confluent-operator

if false; then
    exit
fi
source retry.sh; retry 15 kubectl -n operator get sts controlcenter
kubectl -n operator rollout status statefulset/controlcenter
