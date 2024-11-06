#!/bin/bash

declare -i NS_FOUND
NS_FOUND=$(kubectl get namespaces | grep ^nginx | wc -l)

echo "<${NS_FOUND}>"

if [ ${NS_FOUND} -eq 0 ];then
  echo "Namespace nginx is not there. Creating it."
  kubectl create namespace nginx
else
  echo "Namespace nginx is found."
fi

set -x
kubectl apply -f nginx-deployment.yaml
#sleep 10
kubectl apply -f nginx-ingress.yaml
