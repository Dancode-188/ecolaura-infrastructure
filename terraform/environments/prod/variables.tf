variable "region" {
  description = "AWS region"
  default     = "us-west-2"
}

variable "environment" {
  description = "Environment name"
  default     = "prod"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.2.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  default     = ["10.2.1.0/24", "10.2.2.0/24", "10.2.3.0/24"]
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets"
  default     = ["10.2.4.0/24", "10.2.5.0/24", "10.2.6.0/24"]
}

variable "availability_zones" {
  description = "List of availability zones"
  default     = ["us-west-2a", "us-west-2b", "us-west-2c"]
}

variable "instance_count" {
  description = "Number of EC2 instances"
  default     = 3
}

variable "ami_id" {
  description = "AMI ID for EC2 instances"
  default     = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2 AMI (HVM), SSD Volume Type
}

variable "instance_type" {
  description = "Instance type for EC2 instances"
  default     = "t3.medium"
}

variable "db_instance_class" {
  description = "Instance class for RDS"
  default     = "db.t3.medium"
}

variable "db_allocated_storage" {
  description = "Allocated storage for RDS in GB"
  default     = 100
}

variable "db_name" {
  description = "Name of the database"
  default     = "ecolaura_prod"
}

variable "db_username" {
  description = "Username for the database"
  default     = "ecolaura_admin"
}

variable "db_password" {
  description = "Password for the database"
  default     = "use_aws_secrets_manager_in_prod"
}

variable "node_desired_size" {
  description = "Desired number of worker nodes"
  default     = 3
}

variable "node_max_size" {
  description = "Maximum number of worker nodes"
  default     = 6
}

variable "node_min_size" {
  description = "Minimum number of worker nodes"
  default     = 3
}

variable "node_instance_type" {
  description = "Instance type for worker nodes"
  default     = "t3.large"
}