pipeline {
  agent any

  environment { 
    docker_image = 'davictor/2048-game:1.1.0'
    host = 'ec2-user@ec2-3-133-35-106.us-east-2.compute.amazonaws.com'
    ssh_key = '~/k8s-cluster-2048.pem'
  }

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
        sh 'sudo docker build -t $docker_image .'
      }
    }
    
    stage('Push to Docker Hub') {
      steps {
        sh '''
          cat ~/docker_password.txt | sudo docker login --username davictor --password-stdin
          sudo docker push $docker_image
        '''
      }
    }

    stage('Rollout') {
      steps {
        sh '''
          sudo scp -i $ssh_key deployment/k8s/deployment.yaml $host:/home/ec2-user/deployment.yaml
          sudo ssh -i $ssh_key $host
          kubectl apply -f deployment.yaml
          logout
        '''
      }
    }
  }
}