variable "region" {
  description = "AWS region for the Subnet"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "cidr_block" {
  description = "CIDR block for the subnet"
  type        = string
}

variable "availability_zone" {
  description = "Availability zone for the subnet"
  type        = string
}

variable "map_public_ip_on_launch" {
  description = "Enable public IP on instances in this subnet"
  type        = bool
  default     = false
}

variable "name" {
  description = "Name of the Subnet"
  type        = string
}

variable "tags" {
  description = "Tags for the Subnet"
  type        = map(string)
  default     = {}
}
