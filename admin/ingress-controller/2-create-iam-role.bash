#!/bin/bash -x
#eksctl utils associate-iam-oidc-provider --region=us-east-1 --cluster=dev-eks-cluster --approve
eksctl create iamserviceaccount \
  --cluster dev-eks-cluster \
  --namespace kube-system \
  --name aws-load-balancer-controller \
  --attach-policy-arn arn:aws:iam::104984342949:policy/AWSLoadBalancerControllerIAMPolicy \
  --approve

