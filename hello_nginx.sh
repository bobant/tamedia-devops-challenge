#!/bin/bash

# Create hello app
kubectl apply -f hello/service.yaml
kubectl apply -f hello/deployment.yaml
kubectl apply -f hello/ingress-notls.yaml

# Make sure the hello app is reachable through http://hello.<domain_name>


# Enable kube-lego (check mail address)
kubectl apply -f lego/configmap.yaml
kubectl apply -f lego/deployment.yaml

# Enable tls for hello ingress
kubectl apply -f hello/ingress-tls.yaml
