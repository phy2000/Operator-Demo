# This file enables/disables the metric reporter for Confluent Control Center

# to upgrade from yaml file:
# make a copy of the providers file, add the changes,
# and substitute it in the "-f" parameter below.

source ./env.sh
helm upgrade \
	-f $HELMDIR/providers/gcp.yaml \
	--set kafka.enabled=true \
	--set kafka.metricReporter.enabled=true \
	--wait \
	kafka \
	$HELMDIR/confluent-operator
source retry.sh; retry 15 kubectl -n operator get sts kafka
kubectl -n operator rollout status statefulset/kafka
