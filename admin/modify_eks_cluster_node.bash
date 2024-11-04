#!/bin/bash -x
export CLUSTER_NAME='dev-eks-cluster'
export SIZE=$1

if [ -z $1 ];then
  echo "USAGE: $0 <size>"
  exit 0
fi
aws eks update-nodegroup-config \
  --cluster-name ${CLUSTER_NAME} \
  --nodegroup-name <nodegroup-name> \
  --scaling-config minSize=${SIZE},maxSize=${SIZE},desiredSize=${SIZE}
