variable "name" {
  type        = string
  description = "Name for IAM resources"
}

variable "bucket_name" {
  type        = string
  description = "Name of the state bucket"
}

variable "replication_bucket_name" {
  type        = string
  description = "Name of the replication state bucket"
}
