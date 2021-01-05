output "state_bucket_id" {
  value = module.state_bucket.this_s3_bucket_id
}

output "state_bucket_arn" {
  value = module.state_bucket.this_s3_bucket_arn
}

output "state_bucket_region" {
  value = module.state_bucket.this_s3_bucket_region
}

output "state_bucket_domain_name" {
  value = module.state_bucket.this_s3_bucket_bucket_domain_name
}

output "state_bucket_regional_domain_name" {
  value = module.state_bucket.this_s3_bucket_bucket_regional_domain_name
}

output "state_replication_bucket_id" {
  value = module.state_replication_bucket.this_s3_bucket_id
}

output "state_replication_bucket_arn" {
  value = module.state_replication_bucket.this_s3_bucket_arn
}

output "state_replication_bucket_region" {
  value = module.state_replication_bucket.this_s3_bucket_region
}

output "state_replication_bucket_domain_name" {
  value = module.state_replication_bucket.this_s3_bucket_bucket_domain_name
}

output "state_replication_bucket_regional_domain_name" {
  value = module.state_replication_bucket.this_s3_bucket_bucket_regional_domain_name
}

output "state_locking_table_id" {
  value = module.state_locking_table.id
}

output "state_locking_table_arn" {
  value = module.state_locking_table.arn
}

output "state_locking_table_stream_arn" {
  value = module.state_locking_table.stream_arn
}

output "state_locking_table_stream_label" {
  value = module.state_locking_table.stream_label
}
