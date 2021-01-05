resource "aws_security_group" "default" {
  name        = var.name
  description = var.name
  vpc_id      = var.vpc_id

  ingress {
    from_port       = var.ingress_port
    to_port         = var.ingress_port
    protocol        = "tcp"
    security_groups = var.ingress_security_groups
  }

  egress {
    from_port   = var.egress_port
    to_port     = var.egress_port
    protocol    = var.egress_protocol
    cidr_blocks = var.egress_cidr_blocks
  }
}

resource "aws_launch_configuration" "app" {
  name            = var.name
  image_id        = var.ami
  instance_type   = var.instance_type
  key_name        = var.key_pair
  security_groups = [aws_security_group.default.id]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_iam_service_linked_role" "autoscaling" {
  aws_service_name = "autoscaling.amazonaws.com"
  custom_suffix    = var.name
}

resource "aws_autoscaling_group" "app" {
  name                    = var.name
  vpc_zone_identifier     = var.subnet_ids
  max_size                = var.max_instances
  min_size                = var.min_instances
  desired_capacity        = var.desired_instances
  launch_configuration    = aws_launch_configuration.app.name
  termination_policies    = ["OldestInstance"]
  target_group_arns       = var.target_group_arns
  service_linked_role_arn = aws_iam_service_linked_role.autoscaling.arn
  health_check_type       = var.asg_health_check_type

  lifecycle {
    create_before_destroy = true
  }
}
