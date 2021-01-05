output "id" {
  value = aws_lb.alb.id
}

output "arn" {
  value = aws_lb.alb.arn
}

output "dns_name" {
  value = aws_lb.alb.dns_name
}

output "zone_id" {
  value = aws_lb.alb.zone_id
}

output "target_group_name" {
  value = aws_lb_target_group.app.name
}

output "target_group_arn" {
  value = aws_lb_target_group.app.arn
}

output "listener_id" {
  value = aws_lb_listener.app.id
}

output "securiy_group_id" {
  value = aws_security_group.default.id
}
