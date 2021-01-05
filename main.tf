locals {
  prefix = "${var.project}-${var.environment}"
}

module "state_bucket" {
  source = "./modules/s3/state"

  region                  = var.region
  replication_region      = var.replication_region
  bucket_name             = "${local.prefix}-state"
  replication_bucket_name = "${local.prefix}-state-replication"

  force_destroy = true
}


module "vpc" {
  source = "./modules/vpc"

  name   = local.prefix
  region = var.region
  cidr   = var.vpc_network_cidr
  azs    = var.azs

  # ex. 10.0.20.0/22 [1024 IPs]; cidrsubnet(10.0.20.0/22, 4, 0) -> 10.0.20.0/26 (10.0.20.0 to 10.0.20.63) [64 IPs]
  private_subnets = [
    cidrsubnet(var.vpc_network_cidr, 4, 0),
    cidrsubnet(var.vpc_network_cidr, 4, 1),
    cidrsubnet(var.vpc_network_cidr, 4, 2)
  ]

  create_database_subnet_group = true
  database_subnets = [
    cidrsubnet(var.vpc_network_cidr, 4, 3),
    cidrsubnet(var.vpc_network_cidr, 4, 4),
    cidrsubnet(var.vpc_network_cidr, 4, 5)
  ]

  create_elasticache_subnet_group = true
  elasticache_subnets = [
    cidrsubnet(var.vpc_network_cidr, 4, 6),
    cidrsubnet(var.vpc_network_cidr, 4, 7),
    cidrsubnet(var.vpc_network_cidr, 4, 8)
  ]

  public_subnets = [
    cidrsubnet(var.vpc_network_cidr, 4, 9),
    cidrsubnet(var.vpc_network_cidr, 4, 10),
    cidrsubnet(var.vpc_network_cidr, 4, 11)
  ]

  create_redshift_subnet_group = false
}

resource "tls_private_key" "ec2" {
  algorithm = "RSA"
}

module "key_pair" {
  source = "terraform-aws-modules/key-pair/aws"

  key_name   = local.prefix
  public_key = tls_private_key.ec2.public_key_openssh
}

module "alb_app" {
  source = "./modules/elb/alb"

  name = "${local.prefix}-alb-app"

  vpc_id = module.vpc.vpc_id
  azs    = var.azs

  port = 80

  internal_alb = false

  subnet_ids   = module.vpc.public_subnets
  egress_cidrs = module.vpc.private_subnets_cidr_blocks

  target_port         = 80
  target_protocol     = "HTTP"
  target_health_check = "/"

  listener_port     = 80
  listener_protocol = "HTTP"
}

module "asg_app" {
  source = "./modules/asg"

  name = "${local.prefix}-asg-app"

  ami = "ami-049f3725664f54adb"

  key_pair = module.key_pair.this_key_pair_key_name

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  ingress_port            = 80
  ingress_security_groups = [module.alb_app.securiy_group_id]

  min_instances     = 3
  desired_instances = 3
  max_instances     = 9

  target_group_arns = [module.alb_app.target_group_arn]
}

module "alb_worker" {
  source = "./modules/elb/alb"

  name = "${local.prefix}-alb-worker"

  vpc_id = module.vpc.vpc_id
  azs    = var.azs

  port = 80

  internal_alb = true

  subnet_ids   = module.vpc.private_subnets
  egress_cidrs = [module.vpc.vpc_cidr_block]

  target_port         = 80
  target_protocol     = "HTTP"
  target_health_check = "/"

  listener_port     = 80
  listener_protocol = "HTTP"
}

module "asg_worker" {
  source = "./modules/asg"

  name = "${local.prefix}-asg-worker"

  ami = "ami-049f3725664f54adb"

  key_pair = module.key_pair.this_key_pair_key_name

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  ingress_port            = 80
  ingress_security_groups = [module.alb_worker.securiy_group_id]

  min_instances     = 3
  desired_instances = 3
  max_instances     = 9

  target_group_arns = [module.alb_worker.target_group_arn]
}

module "aurora_mysql" {
  source = "./modules/rds/aurora"

  cluster_name  = "${local.prefix}-aurora-mysql"
  database_name = replace(local.prefix, "-", "")

  engine         = "aurora-mysql"
  engine_version = "5.7.mysql_aurora.2.07.2"

  master_user     = var.database_master_username
  master_password = var.database_master_password

  vpc_id = module.vpc.vpc_id
  azs    = var.azs

  db_subnet_name = local.prefix

  security_groups = [module.asg_worker.securiy_group_id]

  db_instances = 4

  skip_final_snapshot = true
}

module "redis" {
  source = "./modules/elasticache/redis"

  cluster_name                  = "${local.prefix}-redis"
  replication_group_description = local.prefix
  number_cache_clusters         = 3

  subnet_group_name = local.prefix

  vpc_id = module.vpc.vpc_id
  azs    = var.azs

  auth_token = var.redis_auth_token

  security_groups = [module.asg_worker.securiy_group_id]
}

module "memcached" {
  source = "./modules/elasticache/memcached"

  cluster_name = "${local.prefix}-memcached"

  subnet_group_name = local.prefix

  vpc_id = module.vpc.vpc_id
  azs    = var.azs

  security_groups = [module.asg_worker.securiy_group_id]
}

module "cloudfront" {
  source = "./modules/cloudfront"

  name = local.prefix
}
