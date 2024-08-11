provider "aws" {
  region = var.region
}

module "networking" {
  source               = "../../modules/networking"
  vpc_cidr             = var.vpc_cidr
  environment          = var.environment
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones   = var.availability_zones
}

module "compute" {
  source         = "../../modules/compute"
  instance_count = var.instance_count
  ami_id         = var.ami_id
  instance_type  = var.instance_type
  subnet_ids     = module.networking.public_subnet_ids
  vpc_id         = module.networking.vpc_id
  environment    = var.environment
}

module "database" {
  source                = "../../modules/database"
  subnet_ids            = module.networking.private_subnet_ids
  vpc_id                = module.networking.vpc_id
  environment           = var.environment
  db_instance_class     = var.db_instance_class
  allocated_storage     = var.db_allocated_storage
  db_name               = var.db_name
  db_username           = var.db_username
  db_password           = var.db_password
  web_security_group_id = module.compute.web_security_group_id
}

module "kubernetes" {
  source             = "../../modules/kubernetes"
  environment        = var.environment
  subnet_ids         = module.networking.private_subnet_ids
  node_desired_size  = var.node_desired_size
  node_max_size      = var.node_max_size
  node_min_size      = var.node_min_size
  node_instance_type = var.node_instance_type
}