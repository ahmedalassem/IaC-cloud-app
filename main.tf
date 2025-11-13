module "vpc" {
  source = "./vpc"

  project_name            = var.project_name
  environment             = var.environment
  vpc_name                = var.vpc_name
  vpc_cidr                = var.vpc_cidr
  pub_subnet_a            = var.pub_subnet_a
  prv_subnet_a            = var.prv_subnet_a
  public_subnet_a_cidr    = var.public_subnet_a_cidr
  private_subnet_a_cidr   = var.private_subnet_a_cidr
  internet_gateway        = var.internet_gateway
}

