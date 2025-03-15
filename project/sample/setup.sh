#!/bin/sh

set -e
set -x

function jenkins-cli () {
  kubectl exec -it jenkins-cli -- jenkins-cli "$@"
}

function jenkins-cli-xml () {
  kubectl exec -i jenkins-cli -- jenkins-cli "$@"
}

function install_plugins () {
  jenkins-cli install-plugin -deploy $1
  jenkins-cli list-plugins | grep $1
}

install_plugins blueocean
install_plugins pipeline-stage-view

jenkins-cli-xml create-job pipeline-hello < job/pipeline-hello.xml 
jenkins-cli list-jobs
jenkins-cli build -s -v pipeline-hello
jenkins-cli get-job pipeline-hello
jenkins-cli reload-job pipeline-hello
#jenkins-cli replay-pipeline -a -n 1 pipeline-hello

jenkins-cli-xml create-view list-view < view/list-view.xml
jenkins-cli add-job-to-view list-view pipeline-hello
