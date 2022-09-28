#!/bin/sh
set -eu

kind create cluster
kubectl wait --for=condition=Ready pods --all --all-namespaces --timeout=60s
kubectl create ns matrixone
kubectl create ns matrixone-operator
helm install op mo/matrixone-operator --version 0.1.0 -n matrixone-operator
kubectl wait --for=condition=Ready pods --all -n matrixone-operator --timeout=60s
kubectl apply -f https://raw.githubusercontent.com/wanglei4687/matrixone-operator/main/examples/mo-cluster.yaml -n matrixone
kubectl wait --for=condition=Ready pods --all -n matrixone --timeout=200s
