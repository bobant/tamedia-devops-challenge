#!/bin/bash

HOSTS="kube-master-1 kube-node-1 kube-node-2 kube-node-3"

gcloud compute instances delete \
  $HOSTS \
  --zone=europe-west1-d \
  --delete-disks=all
  
