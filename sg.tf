# Configure AWS provider
provider "aws" {
  region = "us-east-1"
}

# Create a Security Group
resource "aws_security_group" "web_sg" {
  name        = "web-server-sg"
  description = "Security group for web server access"

  # Allow SSH access (port 22) from anywhere
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow HTTP access (port 80) from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Optional: Add tags
  tags = {
    Name = "web-security-group"
  }
}
