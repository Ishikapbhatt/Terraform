provider "aws" {
  alias = "ec2"
  region = var.region
}

resource "aws_instance" "this" {
  provider      = aws.ec2
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  key_name      = var.key_name

  tags = merge(
    {
      Name = var.name
    },
    var.tags
  )
}
