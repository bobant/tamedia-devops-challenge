#!/bin/bash

# Create the kube-lego related objects: Namespace, ConfigMap and Deployment
kubectl apply -f lego/00-namespace.yaml
kubectl apply -f lego/configmap.yaml
kubectl apply -f lego/deployment.yaml

# Create hello app server in separate namespace with related object
kubectl apply -f hello/00-namespace.yaml
kubectl apply -f hello/service.yaml
kubectl apply -f hello/deployment.yaml
kubectl apply -f hello/ingress-tls.yaml
