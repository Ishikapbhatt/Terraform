provider "aws" {
  region = "us-east-1"
}

# Security Group
resource "aws_security_group" "ssh_access" {
  name        = "allow-ssh-access"
  description = "Allow SSH access"

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 Instance
resource "aws_instance" "web_server" {
  ami           = "ami-01816d07b1128cd2d" # Ubuntu AMI for us-east-1
  instance_type = "t2.micro"
  security_groups = [aws_security_group.ssh_access.name]

  tags = {
    Name = "Terraform-Local-Exec"
  }

  # Local Provisioner
  provisioner "local-exec" {
    # Write instance details to a file
    command = <<EOT
      echo "Instance Details:" > instance_details.txt
      echo "Public IP: ${self.public_ip}" >> instance_details.txt
      echo "Instance ID: ${self.id}" >> instance_details.txt
      echo "Provisioning Completed!" >> instance_details.txt
    EOT
  }

  provisioner "local-exec" {
    # Print success message to console
    command = "echo 'EC2 Instance has been provisioned with IP: ${self.public_ip}'"
  }

  provisioner "local-exec" {
    # Trigger a local script (simulate additional configuration or logging)
    command = "bash post_provision_script.sh ${self.public_ip}"
  }
}

# Output Public IP
output "instance_public_ip" {
  value = aws_instance.web_server.public_ip
}
