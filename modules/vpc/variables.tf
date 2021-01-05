variable "name" {
  type        = string
  description = "VPC name"
}

variable "region" {
  type        = string
  description = "AWS region to create resources"
}

variable "azs" {
  type        = list(string)
  description = "Availability zones of the region"
}

variable "cidr" {
  type        = string
  description = "VPC CIDR"
}

variable "private_subnets" {
  type        = list(string)
  description = "VPC Private subnet CIDR ranges"
  default     = []
}

variable "private_subnet_suffix" {
  type    = string
  default = "private"
}

variable "private_subnet_tags" {
  type        = map(string)
  description = "Additional tags for the private subnets"
  default     = {}
}

variable "public_subnets" {
  type        = list(string)
  description = "VPC Public subnet CIDR ranges"
  default     = []
}

variable "public_subnet_suffix" {
  type    = string
  default = "public"
}

variable "public_subnet_tags" {
  type        = map(string)
  description = "Additional tags for the public subnets"
  default     = {}
}

variable "create_database_subnet_group" {
  type        = bool
  description = "Controls if database subnet group should be created (n.b. database_subnets must also be set)"
  default     = false
}

variable "database_subnets" {
  type        = list(string)
  description = "VPC Database subnet CIDR ranges"
  default     = []
}

variable "database_subnet_suffix" {
  type    = string
  default = "db"
}

variable "create_elasticache_subnet_group" {
  type        = bool
  description = "Controls if elasticache subnet group should be created"
  default     = false
}

variable "elasticache_subnets" {
  type        = list(string)
  description = "VPC Elasticache subnet CIDR ranges"
  default     = []
}

variable "elasticache_subnet_suffix" {
  type    = string
  default = "elasticache"
}

variable "create_redshift_subnet_group" {
  type        = bool
  description = "Controls if redshift subnet group should be created"
  default     = false
}

variable "redshift_subnets" {
  type        = list(string)
  description = "VPC Redshift subnet CIDR ranges"
  default     = []
}

variable "redshift_subnet_suffix" {
  type    = string
  default = "redshift"
}

variable "intra_subnets" {
  type        = list(string)
  description = "VPC Intra subnet CIDR ranges, no NAT access"
  default     = []
}

variable "intra_subnet_suffix" {
  type    = string
  default = "intra"
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "Should be true to enable DNS hostnames in the VPC"
  default     = true
}

variable "enable_dns_support" {
  type        = bool
  description = "Whether or not the VPC has DNS support"
  default     = true
}

variable "enable_nat_gateway" {
  type        = bool
  description = "Should be true if you want to provision NAT Gateways for each of your private networks"
  default     = true
}

variable "single_nat_gateway" {
  type        = bool
  description = "Should be true if you want to provision a single shared NAT Gateway across all of your private networks"
  default     = true
}

variable "one_nat_gateway_per_az" {
  type        = bool
  description = "Should be true if you want only one NAT Gateway per availability zone. Requires var.azs to be set, and the number of public_subnets created to be greater than or equal to the number of availability zones specified in var.azs."
  default     = false
}

variable "enable_classiclink" {
  type        = bool
  description = "Should be true to enable ClassicLink for the VPC. Only valid in regions and accounts that support EC2 Classic."
  default     = null
}

variable "enable_classiclink_dns_support" {
  type        = bool
  description = "Should be true to enable ClassicLink DNS Support for the VPC. Only valid in regions and accounts that support EC2 Classic."
  default     = null
}

variable "customer_gateways" {
  type    = map(map(any))
  default = {}
}

variable "enable_vpn_gateway" {
  type        = bool
  description = "Should be true if you want to create a new VPN Gateway resource and attach it to the VPC"
  default     = false
}

variable "enable_dhcp_options" {
  type    = bool
  default = false
}

variable "dhcp_options_domain_name" {
  type    = string
  default = null
}

variable "dhcp_options_domain_name_servers" {
  type = list(string)
  default = [
    "AmazonProvidedDNS"
  ]
}

# private endpoints (Gateway)
variable "enable_s3_endpoint" {
  type    = bool
  default = false
}

variable "enable_dynamodb_endpoint" {
  type    = bool
  default = false
}

# private endpoints (Interface)
variable "enable_ec2_endpoint" {
  type    = bool
  default = false
}

variable "ec2_endpoint_private_dns_enabled" {
  type    = bool
  default = false
}

variable "enable_ecr_api_endpoint" {
  type    = bool
  default = false
}

variable "ecr_api_endpoint_private_dns_enabled" {
  type    = bool
  default = false
}

variable "enable_ecr_dkr_endpoint" {
  type    = bool
  default = false
}

variable "ecr_dkr_endpoint_private_dns_enabled" {
  type    = bool
  default = false
}

variable "enable_kms_endpoint" {
  type    = bool
  default = false
}

variable "kms_endpoint_private_dns_enabled" {
  type    = bool
  default = false
}

variable "enable_ec2_autoscaling_endpoint" {
  type    = bool
  default = false
}

variable "ec2_autoscaling_endpoint_private_dns_enabled" {
  type    = bool
  default = false
}

variable "enable_ec2messages_endpoint" {
  type    = bool
  default = false
}

variable "ec2messages_endpoint_private_dns_enabled" {
  type    = bool
  default = false
}

variable "enable_ebs_endpoint" {
  type    = bool
  default = false
}

variable "ebs_endpoint_private_dns_enabled" {
  type    = bool
  default = false
}

variable "enable_ecs_agent_endpoint" {
  type    = bool
  default = false
}

variable "ecs_agent_endpoint_private_dns_enabled" {
  type    = bool
  default = false
}

variable "enable_ecs_endpoint" {
  type    = bool
  default = false
}

variable "ecs_endpoint_private_dns_enabled" {
  type    = bool
  default = false
}

variable "enable_ecs_telemetry_endpoint" {
  type    = bool
  default = false
}

variable "ecs_telemetry_endpoint_private_dns_enabled" {
  type    = bool
  default = false
}

variable "enable_efs_endpoint" {
  type    = bool
  default = false
}

variable "efs_endpoint_private_dns_enabled" {
  type    = bool
  default = false
}

variable "enable_elastic_inference_runtime_endpoint" {
  type    = bool
  default = false
}

variable "elastic_inference_runtime_endpoint_private_dns_enabled" {
  type    = bool
  default = false
}

variable "enable_elasticbeanstalk_endpoint" {
  type    = bool
  default = false
}

variable "elasticbeanstalk_endpoint_private_dns_enabled" {
  type    = bool
  default = false
}

variable "enable_elasticbeanstalk_health_endpoint" {
  type    = bool
  default = false
}

variable "elasticbeanstalk_health_endpoint_private_dns_enabled" {
  type    = bool
  default = false
}

variable "enable_elasticloadbalancing_endpoint" {
  type    = bool
  default = false
}

variable "elasticloadbalancing_endpoint_private_dns_enabled" {
  type    = bool
  default = false
}

variable "enable_emr_endpoint" {
  type    = bool
  default = false
}

variable "emr_endpoint_private_dns_enabled" {
  type    = bool
  default = false
}

variable "enable_events_endpoint" {
  type    = bool
  default = false
}

variable "events_endpoint_private_dns_enabled" {
  type    = bool
  default = false
}

variable "enable_git_codecommit_endpoint" {
  type    = bool
  default = false
}

variable "git_codecommit_endpoint_private_dns_enabled" {
  type    = bool
  default = false
}

variable "enable_glue_endpoint" {
  type    = bool
  default = false
}

variable "glue_endpoint_private_dns_enabled" {
  type    = bool
  default = false
}

variable "enable_kinesis_firehose_endpoint" {
  type    = bool
  default = false
}

variable "kinesis_firehose_endpoint_private_dns_enabled" {
  type    = bool
  default = false
}

variable "enable_kinesis_streams_endpoint" {
  type    = bool
  default = false
}

variable "kinesis_streams_endpoint_private_dns_enabled" {
  type    = bool
  default = false
}

variable "enable_logs_endpoint" {
  type    = bool
  default = false
}

variable "logs_endpoint_private_dns_enabled" {
  type    = bool
  default = false
}

variable "enable_monitoring_endpoint" {
  type    = bool
  default = false
}

variable "monitoring_endpoint_private_dns_enabled" {
  type    = bool
  default = false
}

variable "enable_qldb_session_endpoint" {
  type    = bool
  default = false
}

variable "qldb_session_endpoint_private_dns_enabled" {
  type    = bool
  default = false
}

variable "enable_rekognition_endpoint" {
  type    = bool
  default = false
}

variable "rekognition_endpoint_private_dns_enabled" {
  type    = bool
  default = false
}

variable "enable_sagemaker_api_endpoint" {
  type    = bool
  default = false
}

variable "sagemaker_api_endpoint_private_dns_enabled" {
  type    = bool
  default = false
}

variable "enable_sagemaker_notebook_endpoint" {
  type    = bool
  default = false
}

variable "sagemaker_notebook_endpoint_private_dns_enabled" {
  type    = bool
  default = false
}

variable "sagemaker_notebook_endpoint_region" {
  type    = string
  default = null
}

variable "enable_sagemaker_runtime_endpoint" {
  type    = bool
  default = false
}

variable "sagemaker_runtime_endpoint_private_dns_enabled" {
  type    = bool
  default = false
}

variable "enable_secretsmanager_endpoint" {
  type    = bool
  default = false
}

variable "secretsmanager_endpoint_private_dns_enabled" {
  type    = bool
  default = false
}

variable "enable_servicecatalog_endpoint" {
  type    = bool
  default = false
}

variable "servicecatalog_endpoint_private_dns_enabled" {
  type    = bool
  default = false
}

variable "enable_ses_endpoint" {
  type    = bool
  default = false
}

variable "ses_endpoint_private_dns_enabled" {
  type    = bool
  default = false
}

variable "enable_sms_endpoint" {
  type    = bool
  default = false
}

variable "sms_endpoint_private_dns_enabled" {
  type    = bool
  default = false
}

variable "enable_sns_endpoint" {
  type    = bool
  default = false
}

variable "sns_endpoint_private_dns_enabled" {
  type    = bool
  default = false
}

variable "enable_sqs_endpoint" {
  type    = bool
  default = false
}

variable "sqs_endpoint_private_dns_enabled" {
  type    = bool
  default = false
}

variable "enable_ssm_endpoint" {
  type    = bool
  default = false
}

variable "ssm_endpoint_private_dns_enabled" {
  type    = bool
  default = false
}

variable "enable_ssmmessages_endpoint" {
  type    = bool
  default = false
}

variable "ssmmessages_endpoint_private_dns_enabled" {
  type    = bool
  default = false
}

variable "enable_states_endpoint" {
  type    = bool
  default = false
}

variable "states_endpoint_private_dns_enabled" {
  type    = bool
  default = false
}

variable "enable_storagegateway_endpoint" {
  type    = bool
  default = false
}

variable "storagegateway_endpoint_private_dns_enabled" {
  type    = bool
  default = false
}

variable "enable_sts_endpoint" {
  type    = bool
  default = false
}

variable "sts_endpoint_private_dns_enabled" {
  type    = bool
  default = false
}

variable "enable_transfer_endpoint" {
  type    = bool
  default = false
}

variable "transfer_endpoint_private_dns_enabled" {
  type    = bool
  default = false
}

variable "enable_transferserver_endpoint" {
  type    = bool
  default = false
}

variable "transferserver_endpoint_private_dns_enabled" {
  type    = bool
  default = false
}

variable "enable_workspaces_endpoint" {
  type    = bool
  default = false
}

variable "workspaces_endpoint_private_dns_enabled" {
  type    = bool
  default = false
}
