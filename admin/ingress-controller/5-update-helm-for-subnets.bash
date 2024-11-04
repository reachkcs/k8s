#!/bin/bash -x
helm upgrade -i aws-load-balancer-controller eks/aws-load-balancer-controller -n kube-system -f update-helm-for-subnets.yaml


# Below command gives Error: failed parsing --set data: key
#helm upgrade -i aws-load-balancer-controller eks/aws-load-balancer-controller \
  #-n kube-system \
  #--set clusterName=dev-eks-cluster \
  #--set serviceAccount.create=false \
  #--set serviceAccount.name=aws-load-balancer-controller \
  #--set vpc.subnets.private="[subnet-09d95aa73fbfb1a77,subnet-0388bee1ac21cadac]" \
  #--set vpc.subnets.public="[subnet-0d5889364b1942460]" \
  #--set region=us-east-1

#  --set vpc.subnets.public="[subnet-0d5889364b1942460,subnet-0538e062601d9df64]"
