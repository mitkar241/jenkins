#!/bin/sh

set -e
set -x

function jenkins-cli () {
  kubectl exec -it jenkins-cli -- jenkins-cli "$@"
}

jenkins-cli remove-job-from-view list-view pipeline-hello
jenkins-cli delete-view list-view

jenkins-cli disable-job pipeline-hello
jenkins-cli delete-job pipeline-hello
