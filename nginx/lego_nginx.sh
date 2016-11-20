#!/bin/bash

# Create namespaces for hello app, kube-lego and nginx-ingress
kubectl apply -f hello/00-namespace.yaml
kubectl apply -f lego/00-namespace.yaml
kubectl apply -f nginx/00-namespace.yaml

# Create a default http backend
kubectl apply -f nginx/default-deployment.yaml
kubectl apply -f nginx/default-service.yaml

# Create nginx ingress
kubectl apply -f nginx/configmap.yaml
kubectl apply -f nginx/service.yaml
kubectl apply -f nginx/deployment.yaml

# Wait for compiting LB creation and check public IP
#!/bin/bash
i=1
while [ "$FRONTEND_SERVICE_IP" == "" ]; do
   FRONTEND_SERVICE_IP=$(kubectl get -o jsonpath="{.status.loadBalancer.ingress[0].ip}" --namespace=nginx-ingress services nginx)
   sleep 5
   let WAIT_TIME=5*$i
   let i=$i+1
   echo Waiting... ${WAIT_TIME} seconds,
done
echo Load Balancer Public IP: ${FRONTEND_SERVICE_IP}
