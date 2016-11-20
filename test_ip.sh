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
