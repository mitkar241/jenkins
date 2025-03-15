#!/bin/sh

set -e
set -x

admin_password=$(kubectl exec -it svc/jenkins -c jenkins -- /bin/cat /run/secrets/additional/chart-admin-password && echo)

helm install jenkins-cli jenkins-cli/ --set JENKINS_API_TOKEN=${admin_password}

#echo "Waiting for my-app deployment to be ready..."
kubectl wait --for=condition=Ready pod/jenkins-cli --timeout=300s
