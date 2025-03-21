#!/usr/bin/env groovy

pipeline {
  agent none
  stages {
    stage('Non-Sequential Stage') {
      agent {
        label 'jenkins-jenkins-agent'
      }
      steps {
        echo "On Non-Sequential Stage"
      }
    }
    stage('Sequential') {
      agent {
        label 'jenkins-jenkins-agent'
      }
      environment {
        FOR_SEQUENTIAL = "some-value"
      }
      stages {
        stage('In Sequential 1') {
          steps {
            echo "In Sequential 1"
          }
        }
        stage('In Sequential 2') {
          steps {
            echo "In Sequential 2"
          }
        }
        stage('Parallel In Sequential') {
          parallel {
            stage('In Parallel 1') {
              steps {
                echo "In Parallel 1"
              }
            }
            stage('In Parallel 2') {
              steps {
                echo "In Parallel 2"
              }
            }
          }
        }
      }
    }
  }
}
