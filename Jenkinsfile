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

    stage('Build Docker image') {
      steps {
        sh 'docker build -t davictor/2048-game:1.1.0 .'
      }
    }
    
    stage('Push to Docker Hub') {
      steps {
        sh '''
          cat ~/docker_password.txt | docker login --username davictor --password-stdin
          docker push davictor/2048-game:1.1.0
        '''
      }
    }
  }
}