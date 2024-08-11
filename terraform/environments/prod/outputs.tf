output "vpc_id" {
  value = module.networking.vpc_id
}

output "public_subnet_ids" {
  value = module.networking.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.networking.private_subnet_ids
}

output "web_instance_ids" {
  value = module.compute.instance_ids
}

output "web_instance_public_ips" {
  value = module.compute.instance_public_ips
}

output "db_endpoint" {
  value = module.database.db_instance_endpoint
}

output "eks_cluster_endpoint" {
  value = module.kubernetes.cluster_endpoint
}

output "eks_cluster_name" {
  value = module.kubernetes.cluster_name
}