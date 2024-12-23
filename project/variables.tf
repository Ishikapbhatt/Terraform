# General AWS Region
variable "region" {
  description = "AWS region to deploy the infrastructure"
  type        = string
  default     = "us-east-1" # Change as needed
}

# VPC Variables
variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  description = "Name for the VPC"
  type        = string
  default     = "my-vpc"
}

# Subnet Variables
variable "subnet_cidr_block" {
  description = "CIDR block for the Subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "subnet_az" {
  description = "Availability zone for the Subnet"
  type        = string
  default     = "us-east-1a"
}

variable "subnet_map_public_ip_on_launch" {
  description = "Whether to map public IPs on instance launch"
  type        = bool
  default     = true
}

# EC2 Variables
variable "ec2_ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0c02fb55956c7d316" # Amazon Linux 2 AMI
}

variable "ec2_instance_type" {
  description = "Instance type for the EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "ec2_key_name" {
  description = "Key pair name for SSH access"
  type        = string
  default     = "my-key-pair" # Update with your key pair
}
