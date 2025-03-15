#!/usr/bin/env groovy

pipeline {
  agent {
    node {
      label 'jenkins-jenkins-agent'
      //customWorkspace '/some/other/path'
    }
  }

  stages {
    stage('hello') {
      parallel {

        stage('echo') {
          agent {
            label 'jenkins-jenkins-agent'
          }
          steps {
            sh '''
              #!/bin/bash
              
              set -e
              set -x
              
              sleep 10
              echo "hello world"
              sleep 10
            '''
          }
          post {
            always {
              echo "completed!!!"
            }
          }
        }

        stage('hostname') {
          agent {
            label 'jenkins-jenkins-agent'
          }
          steps {
            sh '''
              #!/bin/bash
              
              set -e
              set -x
              
              sleep 10
              hostname
              sleep 10
            '''
          }
          post {
            always {
              echo "completed!!!"
            }
          }
        }

      }
    }

    stage('pwd') {
      agent {
        label 'jenkins-jenkins-agent'
      }
      steps {
        sh '''
          #!/bin/bash
          
          set -e
          set -x
          
          sleep 10
          pwd
          sleep 10
        '''
      }
      post {
        always {
          echo "completed!!!"
        }
      }
    }

  }
}
