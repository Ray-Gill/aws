output "id" {
  value = aws_elasticache_replication_group.redis_cluster.id
}

output "endpoint" {
  value = aws_elasticache_replication_group.redis_cluster.configuration_endpoint_address
}
