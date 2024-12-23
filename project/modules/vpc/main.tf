provider "aws" {
  alias = "vpc"
  region = var.region
}

resource "aws_vpc" "this" {
  provider             = aws.vpc
  cidr_block           = var.cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = merge(
    {
      Name = var.name
    },
    var.tags
  )
}
