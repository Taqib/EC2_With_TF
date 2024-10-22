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


Step 2: Manually Create VPC and Public Subnet for the EC2
1. Create VPC
2. Create Subnet
3. Create Internet Gateway and Configure Route Table

Step 2: Set Up Terraform Configuration

1. Create a Directory for the Project

2. Configure the AWS Provider

3. Create an SSH Key Pair

If you don't have an SSH key pair, generate one using the following command:
--ssh-keygen -t rsa -b 2048 -f ~/.ssh/web_key -N ""

This will create two files: web_key (private key) and web_key.pub (public key) in your .ssh directory.

To securely access your EC2 instance, you'll need an SSH key pair. Terraform will use this key pair during the creation of your EC2 instance.
"
resource "aws_key_pair" "web_key" {
  key_name   = "web_key"
  public_key = file("~/.ssh/web_key.pub")
}
"
key_name: The name of the key pair.
public_key: The path to your public SSH key file.

4. Deploy an EC2 Instance
Next, define the EC2 instance that will be deployed within your pre-configured VPC and Subnet. The instance will use the SSH key pair you created earlier and will have an NGINX web server installed.

ami: The Amazon Machine Image (AMI) ID for Ubuntu.
instance_type: The type of instance to launch (t2.micro for a free-tier eligible instance).
key_name: The SSH key pair for secure access.
subnet_id: The ID of the public subnet where the instance will be deployed.
vpc_security_group_ids: A list of security group IDs for the instance.
associate_public_ip_address: Ensures the instance gets a public IP for SSH access.

5. Create a Security Group for SSH Access
To allow SSH access to the EC2 instance, you need to create a security group that permits incoming connections on port 22.

6. Output the Public IP of the EC2 Instance
After creating the instance, you can output its public IP address, which will be used for SSH access.


Step 3: Deploy the Infrastructure
With your Terraform configuration ready, proceed to initialize, plan, and apply it.

--terraform init
--terraform plan
--terraform apply

