#!/bin/sh
set -eu

kind create cluster
kubectl create ns matrixone
kubectl create ns matrixone-operator
helm repo add https://matrixorigin.github.io/matrixone-operator/charts
helm install matrixone-operator matrixone-operator/matrixone-operator --version 0.1.0
kubectl apply -f https://github.com/matrixorigin/matrixone-operator/blob/main/examples/mo-cluster.yaml

tail -f /dev/null

