module "vpc" {
  source     = "./modules/vpc"
  region     = var.region
  cidr_block = var.vpc_cidr_block
  name       = var.vpc_name
  tags       = { Environment = "dev" }
}

module "subnet" {
  source               = "./modules/subnet"
  region               = var.region
  vpc_id               = module.vpc.vpc_id
  cidr_block           = var.subnet_cidr_block
  availability_zone    = var.subnet_az
  map_public_ip_on_launch = var.subnet_map_public_ip_on_launch
  name                 = "my-subnet"
  tags                 = { Environment = "dev" }
}

module "ec2" {
  source         = "./modules/ec2"
  region         = var.region
  ami            = var.ec2_ami
  instance_type  = var.ec2_instance_type
  subnet_id      = module.subnet.subnet_id
  key_name       = "my-key-pair" # Ensure this matches your AWS key pair
  name           = "my-ec2"
  tags           = { Environment = "dev" }
}
