output "cluster_address" {
  value = aws_rds_cluster.aurora_cluster.endpoint
}

output "database_name" {
  value = aws_rds_cluster.aurora_cluster.database_name
}

output "admin_username" {
  value = aws_rds_cluster.aurora_cluster.master_username
}

output "admin_password" {
  value     = aws_rds_cluster.aurora_cluster.master_password
  sensitive = true
}

output "availability_zones" {
  value = aws_rds_cluster.aurora_cluster.availability_zones
}

output "database_client_secutiy_group_id" {
  value = aws_security_group.default.id
}
