source ./env.sh
helm install \
	-f $HELMDIR/providers/gcp.yaml \
	--namespace operator \
	--set zookeeper.enabled=true \
	zookeeper \
	$HELMDIR/confluent-operator
