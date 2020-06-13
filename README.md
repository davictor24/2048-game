# 2048-game
Deploying a Web application, along with the infrastructure needed to run it. 
Developed as the final project for the Udacity Cloud DevOps Nanodegree. 

The application deployed is a [2048 game](https://github.com/gabrielecirulli/2048).

## Flow
- Infrastructure is provisioned using CloudFormation scripts. These include a Jenkins build server and Kubernetes nodes.
- Code is pushed to Github and the Jenkins build server is triggered.
- Jenkins builds a Docker image and uploads it to Docker Hub.
- Deployment and Service scripts for Kubernetes are uploaded to the Kubernetes cluster. The container orchestration process starts.
- The game is accessible via a public URL.
