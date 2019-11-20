#!/bin/bash
source ./env.sh

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
