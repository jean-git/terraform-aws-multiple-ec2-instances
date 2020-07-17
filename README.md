# Introduction
This is a terraform project to deploy 3 EC2 Instances and install docker. This will create the following resources in AWS:
- 3 EC2 instances(ubuntu 18.04) in default VPC
- Security groups to to allow access on http, https and ssh protocols

# How To Run
- Clone this repository
- Make sure you have terraform installed
- Make sure, AWS credentials are set in ~/.aws/credentials
- in variables.tf file, change variable value(aws-key-us-west-2) to you EC2 Key Name
- Run terraform init to initialize this as terraform repository
- Run terraform plan to see what all resources are going to get created
- Run terraform apply to actually create the resources

# Output
Once you have created the infrastructure, its going to output the Elastic IPs of each server.