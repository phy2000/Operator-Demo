source ./env.sh
helm install \
    -f $HELMDIR/providers/gcp.yaml \
    --name schemaregistry \
    --namespace operator \
    --set schemaregistry.enabled=true \
    $MEMREQ \
    $HELMDIR/confluent-operator

source ./retry.sh; retry 15 kubectl -n operator get sts schemaregistry
kubectl -n operator rollout status statefulset/schemaregistry
