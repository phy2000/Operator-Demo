HELMDIR=/Users/pyoung/WORK/Operator/helm
cd $HELMDIR
helm install \
	-f ./providers/gcp.yaml \
	--name kafka \
	--namespace operator \
	--set kafka.enabled=true \
	./confluent-operator