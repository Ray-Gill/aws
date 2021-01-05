output "id" {
  value = aws_elasticache_cluster.memcached_cluster.id
}

output "endpoint" {
  value = aws_elasticache_cluster.memcached_cluster.configuration_endpoint
}

output "address" {
  value = aws_elasticache_cluster.memcached_cluster.cluster_address
}
