source ./env.sh
helm install \
	-f $HELMDIR/providers/gcp.yaml \
	--namespace operator \
	--set kafka.enabled=true \
	kafka \
	$HELMDIR/confluent-operator
