#!/bin/bash

set -e
set -x

mkdir /tmp/jenkins
chmod 777 /tmp/jenkins
kubectl apply -f jenkins/persistentVolume.yaml

#helm search repo jenkins
helm repo add jenkins https://charts.jenkins.io
helm repo update
helm install jenkins jenkins/jenkins -f jenkins/override.yaml 

kubectl wait --for=condition=Ready pod/jenkins-0 --timeout=600s
