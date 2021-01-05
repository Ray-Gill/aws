output "ec2_private_key" {
  value     = tls_private_key.ec2.private_key_pem
  sensitive = true
}

output "ec2_keypair_name" {
  value = module.key_pair.this_key_pair_key_name
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "state_bucket_arn" {
  value = module.state_bucket.state_bucket_arn
}

output "state_replication_bucket_arn" {
  value = module.state_bucket.state_replication_bucket_arn
}

output "alb_app_arn" {
  value = module.alb_app.arn
}

output "alb_worker_arn" {
  value = module.alb_worker.arn
}

output "asg_app_name" {
  value = module.asg_app.asg_name
}

output "asg_worker_name" {
  value = module.asg_worker.asg_name
}

output "mysql_cluster_address" {
  value = module.aurora_mysql.cluster_address
}

output "redis_endpoint" {
  value = module.redis.endpoint
}

output "memcached_endpoint" {
  value = module.memcached.endpoint
}

output "cloudfront_domain" {
  value = module.cloudfront.domain_name
}
