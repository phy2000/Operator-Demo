echo $(date) START $0
HELMDIR=~/WORK/Operator/helm
cd $HELMDIR
#kubectl delete --namespace kube-system svc tiller-deploy
#kubectl delete --namespace kube-system deploy tiller-deploy

kubectl create serviceaccount --namespace kube-system tiller
kubectl create clusterrolebinding tiller-cluster-rule --namespace kube-system --clusterrole=cluster-admin --serviceaccount=kube-system:tiller
kubectl patch deploy --namespace kube-system tiller-deploy \
	-p '{"spec":{"template":{"spec":{"serviceAccount":"tiller"}}}}'
helm init --service-account tiller --tiller-namespace kube-system --upgrade
echo $(date) END $0
