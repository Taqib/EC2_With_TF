provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_key_pair" "web_key" {
  key_name   = "web_key"
  public_key = file("~/.ssh/web_key.pub")
}

resource "aws_instance" "web_server" {
  ami           = "ami-060e277c0d4cce553"  # Ubuntu 20.04 AMI ID
  instance_type = "t2.micro"

  key_name = aws_key_pair.web_key.key_name
  subnet_id = "subnet-0a8a54c9f49486f3d"  # Replace with your subnet ID
  vpc_security_group_ids = [aws_security_group.ssh_access.id]
  associate_public_ip_address = true  

  tags = {
    Name        = "web_server"
    Description = "An NGINX web server on Ubuntu"
  }

  user_data = <<-EOF
    #!/bin/bash
    apt-get update
    apt-get install -y nginx
  EOF
}

resource "aws_security_group" "ssh_access" {
  name        = "ssh_access"
  description = "Allow SSH access from anywhere"
  vpc_id      = "vpc-0ea5b676992986bbb"  # Replace with your VPC ID

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
