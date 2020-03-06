echo In Helm 3.0 Tiller is not needed
echo Skipping $0
exit
echo $(date) START $0
source ./env.sh
cd $HELMDIR
#NAMESPACE=operator
NAMESPACE=kube-system

kubectl create serviceaccount --namespace $NAMESPACE tiller
kubectl create clusterrolebinding tiller-cluster-rule --namespace $NAMESPACE --clusterrole=cluster-admin --serviceaccount=$NAMESPACE:tiller
kubectl patch deploy --namespace $NAMESPACE tiller-deploy \
	-p '{"spec":{"template":{"spec":{"serviceAccount":"tiller"}}}}'
helm init --service-account tiller --tiller-namespace $NAMESPACE --upgrade
echo $(date) END $0
