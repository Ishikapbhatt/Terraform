provider "aws" {
  region = "us-east-1"
}

# Generate an SSH key pair locally
resource "tls_private_key" "example" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "aws_key_pair" "deployer_key" {
  key_name   = "deployer-key"
  public_key = tls_private_key.example.public_key_openssh
}

# Create a Security Group
resource "aws_security_group" "web_sg" {
  name_prefix = "web-sg-"

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Launch EC2 Instance
resource "aws_instance" "web_server" {
  ami           = "ami-0e2c8caa4b6378d8c" # Ubuntu AMI for us-east-1
  instance_type = "t2.micro"

  key_name      = aws_key_pair.deployer_key.key_name
  security_groups = [aws_security_group.web_sg.name]

  tags = {
    Name = "web-server"
  }

  # Use remote-exec to configure the instance
  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "ubuntu" # Default user for Ubuntu
      private_key = tls_private_key.example.private_key_pem
      host        = self.public_ip
    }

    inline = [
      "sudo apt-get update -y",
      "sudo apt-get install nginx -y",
      "sudo systemctl start nginx",
      "sudo systemctl enable nginx"
    ]
  }
}

# Output Public IP
output "instance_ip" {
  value = aws_instance.web_server.public_ip
}
