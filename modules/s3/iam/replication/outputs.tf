output "policy_id" {
  value = aws_iam_policy.replication.id
}

output "policy_arn" {
  value = aws_iam_policy.replication.arn
}

output "policy_description" {
  value = aws_iam_policy.replication.description
}

output "policy_name" {
  value = aws_iam_policy.replication.name
}

output "policy_path" {
  value = aws_iam_policy.replication.path
}

output "policy" {
  value = aws_iam_policy.replication.policy
}

output "policy_attachment_id" {
  value = aws_iam_policy_attachment.replication.id
}

output "policy_attachment_name" {
  value = aws_iam_policy_attachment.replication.name
}

output "role_id" {
  value = aws_iam_role.replication.id
}

output "role_arn" {
  value = aws_iam_role.replication.arn
}

output "role_description" {
  value = aws_iam_role.replication.description
}

output "role_name" {
  value = aws_iam_role.replication.name
}

output "role_unique_id" {
  value = aws_iam_role.replication.unique_id
}
