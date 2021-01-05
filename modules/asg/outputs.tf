output "asg_name" {
  description = "Auto-scaling group name"
  value       = aws_autoscaling_group.app.name
}

output "securiy_group_id" {
  value = aws_security_group.default.id
}
