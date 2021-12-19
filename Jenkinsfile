pipeline {
  agent any
  stages {
    stage('Deps') {
      steps {
        sh 'make deps'
        }
      }
      stage('Lint') {
        sh 'make lint'
        }
      }
      stage('Test') {
        steps {
          sh 'make test'
          }
      }
    }
  }
