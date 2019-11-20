source env.sh
SET_DOMAIN="--set controlcenter.loadBalancer.domain=mydomain" 

helm upgrade -f $HELMDIR/providers/gcp.yaml \
 --set controlcenter.enabled=true \
 --set controlcenter.loadBalancer.enabled=true \
 $SET_DOMAIN \
 controlcenter \
 $HELMDIR/confluent-operator
