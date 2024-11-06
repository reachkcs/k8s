#!/bin/bash
NS_NAME=fluent-bit
type -i NS_FOUND=$(kubectl get namespaces | grep ^${NS_NAME} | wc -l)

if [ ${NS_FOUND} -eq 0 ];then
  echo "Namespace ${NS_NAME} is not there. Creating it."
  kubectl create namespace ${NS_NAME}
else
  echo "Namespace ${NS_NAME} is found.
fi
kubens ${NS_NAME}
kubens ${NS_NAME}
kubectl delete -f fluent-bit-configmap.yaml
kubectl delete -f fluent-bit-daemonset.yaml
