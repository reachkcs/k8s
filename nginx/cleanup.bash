#!/bin/bash -x
kubectl delete -f nginx-deployment.yaml
sleep 10
kubectl delete -f nginx-ingress.yaml
