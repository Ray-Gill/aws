output "id" {
  value = module.table.this_dynamodb_table_id
}

output "arn" {
  value = module.table.this_dynamodb_table_arn
}

output "stream_arn" {
  value = module.table.this_dynamodb_table_stream_arn
}

output "stream_label" {
  value = module.table.this_dynamodb_table_stream_label
}
