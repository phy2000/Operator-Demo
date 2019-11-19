echo $(date) START $0
HELMDIR=/Users/pyoung/WORK/Operator/helm
cd $HELMDIR
helm install \
	-f ./providers/gcp.yaml \
	--name operator \
	--namespace operator \
	--set operator.enabled=true \
	./confluent-operator
kubectl -n operator patch serviceaccount default \
	-p '{"imagePullSecrets": [{"name": "confluent-docker-registry" }]}'
echo $(date) END $0
