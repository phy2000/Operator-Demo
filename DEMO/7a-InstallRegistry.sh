HELMDIR=~/WORK/Operator/helm
#MEMREQ="--set schemaregistry.resources.requests.memory=1Gi"
cd $HELMDIR
helm install \
    -f ./providers/gcp.yaml \
    --name schemaregistry \
    --namespace operator \
    --set schemaregistry.enabled=true \
    $MEMREQ \
    ./confluent-operator

source ./retry.sh; retry 15 kubectl -n operator get sts schemaregistry
kubectl -n operator rollout status statefulset/schemaregistry
