export CLUSTER_ID=pyoung-operator-deploy
echo $(date) START $0
gcloud container clusters get-credentials $CLUSTER_ID
# do we need this?? gcloud auth application-default login
echo $(date) END $0
