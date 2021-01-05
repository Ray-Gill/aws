variable "region" {
  type        = string
  description = "AWS region to create resources"
}

variable "replication_region" {
  type        = string
  description = "AWS region to create replication resources"
}

variable "bucket_name" {
  type        = string
  description = "Name of the state bucket"
}

variable "replication_bucket_name" {
  type        = string
  description = "Name of the replication state bucket"
}

variable "force_destroy" {
  type        = bool
  description = "Delete non-empty bucket without error"
  default     = false
}
