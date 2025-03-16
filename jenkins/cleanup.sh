#!/bin/bash

set -e
set -x

helm uninstall jenkins || true

kubectl delete -f jenkins/persistentVolume.yaml || true
sudo rm -rf /tmp/jenkins
