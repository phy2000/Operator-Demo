source ./env.sh
helm install \
    -f $HELMDIR/providers/gcp.yaml \
    --namespace operator \
    --set schemaregistry.enabled=true \
    $MEMREQ \
    schemaregistry \
    $HELMDIR/confluent-operator

retry 15 kubectl -n operator get sts schemaregistry
kubectl -n operator rollout status statefulset/schemaregistry
