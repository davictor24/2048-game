# 2048-game
Deploying a Web application, along with the infrastructure needed to run it. 
Developed as the final project for the Udacity Cloud DevOps Nanodegree. 

The application deployed is a [2048 game](https://github.com/gabrielecirulli/2048).

## Flow
- Infrastructure is provisioned using CloudFormation scripts. These are EC2 instances which act as Kubernetes nodes.
- A Jenkins build server is manually provisioned (a lot of manual setup is involved, so using IaC would be infeasible and hard to maintain).
- (First time) Deployment and service scripts are uploaded to initialise the Kubernetes cluster.
- Code is pushed to Github and the Jenkins build server is triggered.
- Jenkins builds a Docker image and uploads it to Docker Hub.
- Jenkins applies the deployment script on the Kubernetes cluster via SSH. If there is an update, Kubernetes orchestrates a rolling deployment.
- The game is accessible via a public URL.

A temporarily running infrastructure can be tested here: http://ad72275197b3449298d6bfcd97d99769-1358871494.us-east-2.elb.amazonaws.com/.

## Infrastructure overview
- There are three public and three private subnets in three Availability Zones. 
Each AZ (`us-east-2a`, `us-east-2b` and `us-east-2c`) has a public and private subnet.
- The private subnets host the Kubernetes nodes in an autoscaling group.
- The public subnets contain NAT gateways and Bastion hosts in an autoscaling group. These Bastion hosts have `kubectl` bound to the Kubernetes cluster in the private subnets.

## Network addresses (CIDR)
- VPC - 10.0.0.0/16
- Private Subnet 1 - 10.0.0.0/19
- Private Subnet 2 - 10.0.32.0/19
- Private Subnet 3 - 10.0.64.0/19
- Public Subnet 1 - 10.0.128.0/20
- Public Subnet 2 - 10.0.144.0/20
- Public Subnet 3 - 10.0.160.0/20