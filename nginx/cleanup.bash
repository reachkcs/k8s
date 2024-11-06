#!/bin/bash -x
type -i NS_FOUND=$(kubectl get namespaces | grep ^nginx | wc -l)

if [ ${NS_FOUND} -eq 0 ];then
  echo "Namespace nginx is not there. Creating it."
  kubectl create namespace nginx
else
  echo "Namespace nginx is found.
fi

kubectl delete -f nginx-deployment.yaml
#sleep 10
kubectl delete -f nginx-ingress.yaml
