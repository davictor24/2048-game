pipeline {
  agent any
  stages {
    stage('Lint HTML') {
      steps {
        sh 'tidy -qe game/*.html'
      }
    }
    stage('Lint JavaScript') {
      steps {
        sh 'jshint game'
      }
    }
  }
}