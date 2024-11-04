#!/bin/bash -x
kubectl apply -f nginx-deployment.yaml
sleep 10
kubectl apply -f nginx-ingress.yaml
