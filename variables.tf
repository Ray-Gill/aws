variable "region" {
  type        = string
  description = "Primary region for resources"
  default     = "us-east-1"
}

variable "replication_region" {
  type        = string
  description = "Secondary region, replication for cross-region"
  default     = "us-west-1"
}

variable "azs" {
  type        = list(string)
  description = "Availability zones within `region`"
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "environment" {
  type        = string
  description = "Environment"

  validation {
    condition     = can(index(["dev", "prod"], var.environment))
    error_message = "Invalid Environment."
  }
}

variable "project" {
  type        = string
  description = "Project name"
  default     = "raygill-test"
}

variable "vpc_network_cidr" {
  type        = string
  description = "VPC CIDR range"
}

variable "database_master_username" {
  type        = string
  description = "RDS Aurora master username"

  validation {
    condition     = length(var.database_master_username) >= 20
    error_message = "The Database Master username must be at least 20 characters."
  }
}

variable "database_master_password" {
  type        = string
  description = "RDS Aurora master username"

  validation {
    condition     = length(var.database_master_password) >= 41
    error_message = "The Database Master password must be at least 41 characters."
  }
}

variable redis_auth_token {
  type        = string
  description = "Elasticache Redis token (password protected value)"

  validation {
    condition     = length(var.redis_auth_token) >= 64 && length(var.redis_auth_token) <= 128
    error_message = "The Database Master password must be at least 64 characters and at most 128."
  }
}
