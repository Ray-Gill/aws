variable "name" {
  type        = string
  description = "Name for resources"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "azs" {
  type        = list(string)
  description = "Availability zones within `region`"
}

variable "port" {
  type        = number
  description = "Port to open for ALB"
}

variable "ingress_cidrs" {
  type        = list(string)
  description = "List of CIDR to allow traffic to the ALB"
  default     = ["0.0.0.0/0"]
}

variable "egress_cidrs" {
  type        = list(string)
  description = "List of CIDR to allow traffic out from the ALB"
}

variable "internal_alb" {
  type        = bool
  description = "Is the ALB interal or internet facing"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs that ALB is associated with"
}

variable "target_port" {
  type        = number
  description = "The port for ALB target port"
}

variable "target_health_check" {
  type        = string
  description = "Target groups health check endpoint"
}

variable "target_protocol" {
  type        = string
  description = "The target protocol"

  validation {
    condition     = can(index(["HTTP", "HTTPS"], var.target_protocol))
    error_message = "Invalid Target Protocol."
  }
}

variable "listener_port" {
  type        = number
  description = "The port for ALB listener port"
}

variable "listener_protocol" {
  type        = string
  description = "The listener protocol"

  validation {
    condition     = can(index(["HTTP", "HTTPS"], var.listener_protocol))
    error_message = "Invalid Listener Protocol."
  }
}

variable "deregistration_delay" {
  type        = number
  description = "Deregistering time of unused targets (draining to unused)"
  default     = 10

  validation {
    condition     = var.deregistration_delay >= 0 && var.deregistration_delay <= 3600
    error_message = "The Deregistering Delay must be at least 0 and at most 3600 seconds."
  }
}
