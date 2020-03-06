echo $(date) START $0
source ./env.sh
kubectl create namespace operator
helm install \
	-f $HELMDIR/providers/gcp.yaml \
	--namespace operator \
	--set operator.enabled=true \
	operator \
	$HELMDIR/confluent-operator
kubectl -n operator patch serviceaccount default \
	-p '{"imagePullSecrets": [{"name": "confluent-docker-registry" }]}'
echo $(date) END $0
