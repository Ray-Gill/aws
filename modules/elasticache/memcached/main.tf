resource "aws_security_group" "default" {
  name        = var.cluster_name
  description = "Allow inbound traffic from security groups"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = var.port
    to_port         = var.port
    protocol        = "tcp"
    security_groups = var.security_groups
  }
}

resource "aws_elasticache_cluster" "memcached_cluster" {
  cluster_id                   = var.cluster_name
  engine                       = "memcached"
  engine_version               = var.engine_version
  node_type                    = var.node_type
  num_cache_nodes              = var.num_cache_nodes
  port                         = var.port
  parameter_group_name         = var.parameter_group_name
  subnet_group_name            = var.subnet_group_name
  security_group_ids           = [aws_security_group.default.id]
  az_mode                      = "cross-az"
  preferred_availability_zones = var.azs
}
