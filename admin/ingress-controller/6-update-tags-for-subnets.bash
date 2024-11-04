#!/bin/bash -x
export CLUSTER_NAME=dev-eks-cluster
export PRIV_SN1=subnet-07211c3db109eb088
export PRIV_SN2=subnet-02ac4770060531dfb
export PUB_SN1=subnet-0e974f37de694ce15

# Tagging a private subnet
aws ec2 create-tags --resources ${PRIV_SN1} --tags Key=kubernetes.io/cluster/${CLUSTER_NAME},Value=owned
aws ec2 create-tags --resources ${PRIV_SN2} --tags Key=kubernetes.io/role/elb,Value=1

# Tagging a public subnet
aws ec2 create-tags --resources ${PUB_SN1} --tags Key=kubernetes.io/cluster/${CLUSTER_NAME},Value=owned

