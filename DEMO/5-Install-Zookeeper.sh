HELMDIR=/Users/pyoung/WORK/Operator/helm
cd $HELMDIR
helm install \
	-f ./providers/gcp.yaml \
	--name zookeeper \
	--namespace operator \
	--set zookeeper.enabled=true \
	./confluent-operator
