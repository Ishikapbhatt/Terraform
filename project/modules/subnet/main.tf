provider "aws" {
  alias = "subnet"
  region = var.region
}

resource "aws_subnet" "this" {
  provider               = aws.subnet
  vpc_id                 = var.vpc_id
  cidr_block             = var.cidr_block
  availability_zone      = var.availability_zone
  map_public_ip_on_launch = var.map_public_ip_on_launch
  tags = merge(
    {
      Name = var.name
    },
    var.tags
  )
}
