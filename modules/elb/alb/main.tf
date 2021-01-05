resource "aws_security_group" "default" {
  name        = var.name
  description = var.name
  vpc_id      = var.vpc_id

  ingress {
    from_port   = var.port
    to_port     = var.port
    protocol    = "tcp"
    cidr_blocks = var.ingress_cidrs
  }

  egress {
    from_port   = var.port
    to_port     = var.port
    protocol    = "tcp"
    cidr_blocks = var.egress_cidrs
  }
}

resource "aws_lb" "alb" {
  load_balancer_type = "application"

  name     = var.name
  internal = var.internal_alb

  security_groups = [aws_security_group.default.id]

  subnets = var.subnet_ids
}

resource "aws_lb_target_group" "app" {
  name = var.name

  port = var.target_port

  protocol = var.target_protocol

  vpc_id = var.vpc_id

  deregistration_delay = var.deregistration_delay

  health_check {
    path = var.target_health_check
  }
}

resource "aws_lb_listener" "app" {
  load_balancer_arn = aws_lb.alb.arn
  protocol          = var.listener_protocol
  port              = var.listener_port

  default_action {
    target_group_arn = aws_lb_target_group.app.arn
    type             = "forward"
  }

}