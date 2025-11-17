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
  pub_subnet_b            = var.pub_subnet_b
  prv_subnet_b            = var.prv_subnet_b
  public_subnet_b_cidr    = var.public_subnet_b_cidr
  private_subnet_b_cidr   = var.private_subnet_b_cidr
  internet_gateway        = var.internet_gateway
  region                  = var.region
}

module "eks" {
  source = "./eks"

  cluster_name       = var.cluster_name
  kubernetes_version = var.kubernetes_version
  vpc_id             = module.vpc.vpc_id
  vpc_cidr           = module.vpc.vpc_cidr
  subnet_ids         = [module.vpc.private_subnet_id, module.vpc.private_subnet_b_id]
  project_name       = var.project_name
  environment        = var.environment
  node_instance_type = var.node_instance_type
  node_desired_size  = var.node_desired_size
  node_min_size      = var.node_min_size
  node_max_size      = var.node_max_size

  depends_on = [module.vpc]
}

