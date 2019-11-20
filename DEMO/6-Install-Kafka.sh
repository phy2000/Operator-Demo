source ./env.sh
helm install \
	-f $HELMDIR/providers/gcp.yaml \
	--name kafka \
	--namespace operator \
	--set kafka.enabled=true \
	$HELMDIR/confluent-operator
