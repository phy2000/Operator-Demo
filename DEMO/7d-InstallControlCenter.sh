source ./env.sh
helm install \
    -f $HELMDIR/providers/gcp.yaml \
    --namespace operator \
    --set disableHostPort=true \
    --set controlcenter.enabled=true \
    controlcenter \
    $HELMDIR/confluent-operator

if false; then
    exit
fi
source retry.sh; retry 15 kubectl -n operator get sts controlcenter
kubectl -n operator rollout status statefulset/controlcenter
