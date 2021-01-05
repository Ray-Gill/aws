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

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_elasticache_replication_group" "redis_cluster" {
  replication_group_id          = var.cluster_name
  replication_group_description = var.replication_group_description

  availability_zones = var.azs

  at_rest_encryption_enabled = true
  transit_encryption_enabled = true
  auth_token                 = var.auth_token

  node_type                  = var.node_type
  port                       = var.port
  number_cache_clusters      = var.number_cache_clusters
  automatic_failover_enabled = true
  engine                     = "redis"
  engine_version             = var.engine_version
  subnet_group_name          = var.subnet_group_name
  security_group_ids         = [aws_security_group.default.id]
}
