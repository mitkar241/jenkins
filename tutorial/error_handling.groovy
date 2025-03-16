#!/usr/bin/env groovy

pipeline {
  agent any
  stages {
    stage('Error Handling Stage') {
      steps {
        script {
          try {
            sh 'wrong command'
            echo 'Succeeded!'
          } catch (Exception err) {
            echo "Failed: ${err}"
            //echo "Wrong command : " + err.toString()
          } finally {
            /* clean up our workspace */
            // requires plugin: ws-cleanup
            cleanWs()
            //deleteDir()
          }
          echo 'Printed whether above succeeded or failed.'
        }
      }
      // the step as a whole succeeds
    }
  }
}
