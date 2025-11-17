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
  region                  = var.region
}

module "eks" {
  source = "./eks"

  cluster_name       = var.cluster_name
  kubernetes_version = var.kubernetes_version
  vpc_id             = module.vpc.vpc_id
  vpc_cidr           = module.vpc.vpc_cidr
  # EKS requires at least 2 subnets. Using both but worker nodes will be in private subnet
  # Best practice: Control plane uses both, but worker nodes prefer private subnet
  subnet_ids         = [module.vpc.private_subnet_id, module.vpc.public_subnet_id]
  project_name       = var.project_name
  environment        = var.environment

  depends_on = [module.vpc]
}

