provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "docker-node-mongo-app" {
  ami           = "ami-01f5a0b78d6089704"
  instance_type = "t2.micro"
  key_name      = "DevOps-key" # Replace with your key pair name

  security_groups = [aws_security_group.docker-node-mongo-app_sg.name]

  user_data = <<EOF
  #!/bin/bash
  yum update -y

  # Install Docker
  amazon-linux-extras install docker -y
  systemctl start docker
   enable docker
  usermod -aG docker ec2-user

  # Install Docker Compose
  curl -L "https://github.com/docker/compose/releases/download/v2.27.0/docker-compose-linux-x86_64" -o /usr/local/bin/docker-compose
  chmod +x /usr/local/bin/docker-compose
  ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
EOF

  tags = {
    Name = "docker-node-mongo-app"
  }
}

resource "aws_security_group" "docker-node-mongo-app_sg" {
  name        = "docker-node-mongo-app_sg"
  description = "Allow SSH and Docker access"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Change for security reasons
  }

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow our app exposer
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_ec2_instance_state" "stop" {
  instance_id = aws_instance.docker-node-mongo-app.id
  state       = "running"
}

output "public_IP" {
  description = "provide me public_ip"
  value       = aws_instance.docker-node-mongo-app.public_ip
}