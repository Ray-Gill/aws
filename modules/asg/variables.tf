variable "name" {
  type        = string
  description = "Name"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "ami" {
  type        = string
  description = "AMI to create instances related to launch configuration with"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type"
  default     = "t3.micro"
}

variable "key_pair" {
  type        = string
  description = "EC2 key pair for the instance"
}

variable "ingress_port" {
  type        = number
  description = "Port to open for instances"
}

variable "ingress_security_groups" {
  type        = list(string)
  description = "List of security groups to allow egress to instance(s)"
}

variable "egress_port" {
  type        = number
  description = "Security Group egress port"
  default     = 0
}

variable "egress_protocol" {
  type        = string
  description = "Seciroty Group egress protocol"
  default     = "-1"
}

variable "egress_cidr_blocks" {
  type        = list(string)
  description = "Security Group egress list of CIDR"
  default     = ["0.0.0.0/0"]
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs that ALB is associated with"
}

variable "max_instances" {
  type        = number
  description = "Maximum number of instances in auto-scaling group"
}

variable "min_instances" {
  type        = number
  description = "Minimum number of instances in auto-scaling group"
}

variable "desired_instances" {
  type        = number
  description = "Desired number of instances in auto-scaling group"
}

variable "target_group_arns" {
  type        = list(string)
  description = "List of ALB target group ARNs to associate ASG with"
}

variable "asg_health_check_type" {
  type        = string
  description = "Controls how health checking is done. EC2 or ELB"
  default     = "EC2"
}
