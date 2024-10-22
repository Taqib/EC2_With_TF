Deploying an EC2 Instance on AWS using Terraform

In this lab, you will learn how to deploy an EC2 instance on AWS using Terraform. This process will guide you through setting up an SSH key pair, creating a security group for SSH access, and deploying an EC2 instance with a basic NGINX web server. This lab assumes you can manually create a VPC, public subnet, internet gateway, and routing table in AWS.

In this lab, you will:

Configure the AWS provider in Terraform.
Create an SSH key pair for secure access to your EC2 instance.
Define and deploy an EC2 instance running Ubuntu with NGINX installed.
Create a security group to allow SSH access to the instance.
Retrieve and use the public IP address of the instance to SSH into it.

Step 1: Configure AWS CLI
Before starting with Terraform, ensure your AWS CLI is configured. This allows Terraform to interact with your AWS account.


