HELMDIR=~/WORK/Operator/helm
for COMPONENT in connect schemaregistry controlcenter ksql replicator; do
    echo -n " $COMPONENT..."
    helm install \
	-f $HELMDIR/providers/gcp.yaml \
	--set disableHostPort=true \
	--name $COMPONENT \
	--namespace operator \
	--set $COMPONENT.enabled=true \
	$HELMDIR/confluent-operator
    sleep 20
done
echo DONE
