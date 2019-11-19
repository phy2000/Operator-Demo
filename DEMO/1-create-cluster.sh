#!/bin/bash
export PROJECT_ID=solutionsarchitect-01
export CLUSTER_ID=pyoung-operator-deploy
export BASE_REGION=us-central1
export BASE_ZONE=us-central1-a
export BASE_SUBNET=default
#export BASE_CLUSTER_VERSION="--cluster-version 1.14.8-gke.12"
#export BASE_MACHINE_TYPE=n1-highmem-4
export BASE_MACHINE_TYPE=n1-highmem-2
export BASE_IMAGE_TYPE=COS
export BASE_DISK_TYPE=pd-standard
export BASE_DISK_SIZE=32
export BASE_NUM_NODES=12
export KUBECTL_CONTEXT=gke_${PROJECT_ID}_${BASE_ZONE}_${CLUSTER_ID}

echo $(date) START $0
gcloud container clusters create $CLUSTER_ID \
  --enable-cloud-logging \
  --enable-cloud-monitoring \
  ${BASE_CLUSTER_VERSION} \
  --subnetwork default \
  --machine-type $BASE_MACHINE_TYPE \
  --image-type ${BASE_IMAGE_TYPE} \
  --enable-ip-alias \
  --network "projects/${PROJECT_ID}/global/networks/default" \
  --subnetwork "projects/${PROJECT_ID}/regions/${BASE_REGION}/subnetworks/${BASE_SUBNET}" \
  --default-max-pods-per-node "110" \
  --num-nodes $BASE_NUM_NODES \
  --disk-type ${BASE_DISK_TYPE} \
  --disk-size $BASE_DISK_SIZE 

echo $(date) END $0
