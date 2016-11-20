#!/bin/bash

HOSTS="kube-master-1 kube-node-1 kube-node-2 kube-node-3"

gcloud compute instances create \
  $HOSTS \
  --boot-disk-size=20GB \
  --description=kubernetes \
  --machine-type=n1-standard-1 \
  --image-project=ubuntu-os-cloud \
  --image-family=ubuntu-1604-lts \
  --zone=europe-west1-d

for HOST in $HOSTS; do
  gcloud compute copy-files scripts deploy ${HOST}:~ --zone europe-west1-d
done
