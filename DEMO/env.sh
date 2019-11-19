export PROJECT_ID=solutionsarchitect-01
export CLUSTER_ID=pyoung-operator-deploy
export BASE_REGION=us-central1
export BASE_ZONE=us-central1-a
export BASE_SUBNET=default
export BASE_CLUSTER_VERSION=1.14.7-gke.10
export BASE_MACHINE_TYPE=n1-highmem-2
export BASE_IMAGE_TYPE=COS
export BASE_DISK_TYPE=pd-standard
export BASE_DISK_SIZE=100
export BASE_NUM_NODES=10
export KUBECTL_CONTEXT=gke_${PROJECT_ID}_${BASE_ZONE}_${CLUSTER_ID}