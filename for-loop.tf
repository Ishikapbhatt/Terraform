provider "aws" {
  region = "us-east-1"
}

# Generate subnet CIDRs using a for loop
locals {
  subnet_cidrs = [for i in range(3) : "10.0.${i}.0/24"]
}

resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "example" {
  for_each = toset(local.subnet_cidrs)

  vpc_id            = aws_vpc.example.id
  cidr_block        = each.value
  availability_zone = "us-east-1a" # Change or make dynamic as needed
}
