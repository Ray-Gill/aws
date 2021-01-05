variable "cluster_name" {
  type        = string
  description = "Cluster name"
}

variable "database_name" {
  type        = string
  description = "Database name"
}

variable "engine" {
  type        = string
  description = "The name of the database engine to be used for DB cluster"
  default     = "aurora-mysql"

  validation {
    condition     = can(index(["aurora", "aurora-mysql", "aurora-postgresql"], var.engine))
    error_message = "Invalid Aurora engine."
  }
}

variable "engine_version" {
  type        = string
  description = "Database engine versoin"
}

variable "master_user" {
  type        = string
  description = "Username for the master DB user"
}

variable "master_password" {
  type        = string
  description = "Password for the master DB user"
}

variable "retention_period" {
  type        = number
  description = "The number of days to retain backups"
  default     = 32
}

variable "vpc_id" {
  type        = string
  description = "VPC ID for the RDS instance to associated"
}

variable "database_port" {
  type        = number
  description = "Database port"
  default     = 3306
}

variable "security_groups" {
  type        = list(string)
  description = "List of security groups to access DB"
  default     = null
}

variable "db_subnet_name" {
  type        = string
  description = "DB subnet group"
}

variable "db_instances" {
  type        = number
  description = "The number of DB instances to create in the cluster"
  default     = 3
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type to use"
  default     = "db.t3.small"
}

variable "azs" {
  type        = list(string)
  description = "Availability zones within `region`"
}

variable "skip_final_snapshot" {
  type        = bool
  description = "Skip final snapshot"
  default     = false
}