module "vpc" {
  source     = "../../modules/vpc"
  cidr_block = "10.0.0.0/16"
}

module "eks" {
  source       = "../../modules/eks"
  vpc_id       = module.vpc.vpc_id
  subnet_ids   = module.vpc.private_subnet_ids
  cluster_name = "ecommerce-eks"
}

module "rds" {
  source          = "../../modules/rds"
  vpc_id          = module.vpc.vpc_id
  subnet_ids      = module.vpc.private_subnet_ids
  db_name         = "ecommerce"
  db_username_ssm = var.db_username_ssm
  db_password_ssm = var.db_password_ssm
}

module "ssm" {
  source = "../../modules/ssm"
  # This module provisions DB username and password in SSM.
}
