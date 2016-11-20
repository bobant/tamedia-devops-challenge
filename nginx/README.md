# kube-lego example

# Create namespaces

```
# hello
kubectl apply -f hello/00-namespace.yaml
# kube-lego
kubectl apply -f lego/00-namespace.yaml
# nginx-ingress
kubectl apply -f nginx/00-namespace.yaml
```

# Create a default http backend

```
kubectl apply -f nginx/default-deployment.yaml
kubectl apply -f nginx/default-service.yaml
```

# Create nginx ingress

```
kubectl apply -f nginx/configmap.yaml
kubectl apply -f nginx/service.yaml
kubectl apply -f nginx/deployment.yaml
```

The nginx service uses a LoadBalancer to publish the service. A few minutes after you have added the nginx service, you will get it's public IP address or domain via kubectl:

```
kubectl describe svc nginx --namespace nginx-ingress
[...]
LoadBalancer Ingress:   <Public IP address on GCP like 104.199...>
[...]
```

This is the IP address where you have to point your domains to.

# Create an example hello app

```
kubectl apply -f hello/service.yaml
kubectl apply -f hello/deployment.yaml
kubectl apply -f hello/ingress-notls.yaml
```

- Make sure the hello service is reachable through http://hello.<domain_name>

# Enable kube-lego

```
kubectl apply -f lego/configmap.yaml
kubectl apply -f lego/deployment.yaml
```
- Change the email address in `kube-lego-configmap.yaml` before creating the
  kubernetes resource
- Please be aware that kube-lego creates it's related service on its own


# Enable tls for hello ingress

```
kubectl apply -f hello/ingress-tls.yaml
```

# Get debug information

- Look at the log output of the nginx pod
- Look at the log output of the ingress pods
- Sometimes after acquiring a new certifiacte nginx needs to be restarted (as
  it's not watching change events for secrets)
