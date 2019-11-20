echo $(date) START $0
source ./env.sh
helm install \
	-f $HELMDIR/providers/gcp.yaml \
	--name operator \
	--namespace operator \
	--set operator.enabled=true \
	$HELMDIR/confluent-operator
kubectl -n operator patch serviceaccount default \
	-p '{"imagePullSecrets": [{"name": "confluent-docker-registry" }]}'
echo $(date) END $0
