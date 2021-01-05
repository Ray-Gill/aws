variable "cluster_name" {
  type        = string
  description = "Redis cluster name"
}

variable "replication_group_description" {
  type        = string
  description = "The application cache description"
}

variable "subnet_group_name" {
  type        = string
  description = "Name of the Elasticache subnet"
}

variable "node_type" {
  type        = string
  description = "Elasticache instance type"
  default     = "cache.t3.small"
}

variable "port" {
  type        = number
  description = "Elasticache port"
  default     = 6379
}

variable "engine_version" {
  type        = string
  description = "Version of Redis"
  default     = null
}

variable "number_cache_clusters" {
  type        = number
  description = "Number of cache clusters (primary and replicas)"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "azs" {
  type        = list(string)
  description = "Availability zones within `region`"
}

variable "security_groups" {
  type        = list(string)
  description = "List of security groups to access Redis"
  default     = null
}

variable "auth_token" {
  type        = string
  description = "Password for Redis cache"
}
