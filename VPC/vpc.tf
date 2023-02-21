module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc-name
  cidr = var.cidr

  azs             = var.subnet-azs
  private_subnets = var.private-cidr
  public_subnets  = var.public-cidr

  create_igw = var.igw
  private_subnet_names = var.private_subnet_names
  public_subnet_names = var.public_subnet_names
  enable_nat_gateway = true
  single_nat_gateway = true
  enable_dns_support = true
  enable_dns_hostnames = true


  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}