source ./env.sh
helm install \
	-f $HELMDIR/providers/gcp.yaml \
	--name zookeeper \
	--namespace operator \
	--set zookeeper.enabled=true \
	$HELMDIR/confluent-operator
