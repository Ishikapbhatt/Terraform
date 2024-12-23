variable "region" {
  description = "AWS region for the VPC"
  type        = string
}

variable "cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "name" {
  description = "Name of the VPC"
  type        = string
}

variable "tags" {
  description = "Tags for the VPC"
  type        = map(string)
  default     = {}
}
