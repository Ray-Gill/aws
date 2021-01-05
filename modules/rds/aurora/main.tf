resource "aws_kms_key" "aurora_key" {
  description         = "Key is for ${var.cluster_name} RDS Aurora"
  enable_key_rotation = true
}

resource "aws_kms_alias" "aurora_key_alias" {
  name          = "alias/${var.cluster_name}-rds"
  target_key_id = aws_kms_key.aurora_key.key_id
}

resource "aws_security_group" "default" {
  name        = "database-${var.cluster_name}"
  description = "Allow inbound traffic from security groups"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = var.database_port
    to_port         = var.database_port
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

data "aws_db_subnet_group" "default" {
  name = var.db_subnet_name
}

resource "aws_rds_cluster" "aurora_cluster" {
  cluster_identifier = var.cluster_name
  engine             = var.engine
  engine_version     = var.engine_version

  database_name   = var.database_name
  master_username = var.master_user
  master_password = var.master_password

  port                    = var.database_port
  backup_retention_period = var.retention_period

  storage_encrypted = true
  kms_key_id        = aws_kms_alias.aurora_key_alias.target_key_arn

  availability_zones     = var.azs
  vpc_security_group_ids = [aws_security_group.default.id]
  db_subnet_group_name   = data.aws_db_subnet_group.default.name

  skip_final_snapshot = var.skip_final_snapshot
}

resource "aws_rds_cluster_instance" "default" {
  count = var.db_instances

  identifier         = lower("${var.cluster_name}-${count.index + 1}")
  cluster_identifier = aws_rds_cluster.aurora_cluster.id

  instance_class = var.instance_type

  db_subnet_group_name = data.aws_db_subnet_group.default.name

  publicly_accessible = false
  engine              = var.engine
  engine_version      = var.engine_version
}
