variable "cluster_name" {
  type        = string
  description = "Memcached cluster name"
}

variable "subnet_group_name" {
  type        = string
  description = "Name of the Elasticache subnet"
}

variable "node_type" {
  type        = string
  description = "Memcached instance type"
  default     = "cache.t3.small"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "port" {
  type        = number
  description = "Elasticache port"
  default     = 11211
}

variable "engine_version" {
  type        = string
  description = "Version of Memcached"
  default     = null
}

variable "parameter_group_name" {
  type        = string
  description = "Name of parameter group to associate to cluster"
  default     = "default.memcached1.6"
}

variable "num_cache_nodes" {
  type        = number
  description = "Number of cache nodes"
  default     = 3

  validation {
    condition     = var.num_cache_nodes >= 3 && var.num_cache_nodes <= 20
    error_message = "The number of cache nodes must be at least 3 and at most 20."
  }
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
