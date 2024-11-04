#!/bin/bash -x
helm install aws-load-balancer-controller eks/aws-load-balancer-controller \
  --set clusterName=dev-eks-cluster \
  --set serviceAccount.create=false \
  --set serviceAccount.name=aws-load-balancer-controller \
  --set region=us-east-1 \
  -n kube-system

