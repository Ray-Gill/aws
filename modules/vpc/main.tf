data "aws_security_group" "default" {
  name   = "default"
  vpc_id = module.vpc.vpc_id
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.name

  cidr = var.cidr

  azs = var.azs

  private_subnets       = var.private_subnets
  private_subnet_suffix = var.private_subnet_suffix

  public_subnets       = var.public_subnets
  public_subnet_suffix = var.public_subnet_suffix

  intra_subnets       = var.intra_subnets
  intra_subnet_suffix = var.intra_subnet_suffix

  database_subnets             = var.database_subnets
  create_database_subnet_group = var.create_database_subnet_group
  database_subnet_suffix       = var.database_subnet_suffix

  elasticache_subnets             = var.elasticache_subnets
  create_elasticache_subnet_group = var.create_elasticache_subnet_group
  elasticache_subnet_suffix       = var.elasticache_subnet_suffix

  redshift_subnets             = var.redshift_subnets
  create_redshift_subnet_group = var.create_redshift_subnet_group
  redshift_subnet_suffix       = var.redshift_subnet_suffix

  public_subnet_tags  = var.public_subnet_tags
  private_subnet_tags = var.private_subnet_tags

  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_hostnames

  enable_classiclink             = var.enable_classiclink
  enable_classiclink_dns_support = var.enable_classiclink_dns_support

  enable_nat_gateway = var.enable_nat_gateway
  single_nat_gateway = var.single_nat_gateway

  customer_gateways = var.customer_gateways

  enable_vpn_gateway = var.enable_vpn_gateway

  enable_dhcp_options              = var.enable_dhcp_options
  dhcp_options_domain_name         = var.dhcp_options_domain_name
  dhcp_options_domain_name_servers = var.dhcp_options_domain_name_servers

  # VPC Flow Logs (Cloudwatch log group and IAM role will be created)
  enable_flow_log                      = true
  create_flow_log_cloudwatch_log_group = true
  create_flow_log_cloudwatch_iam_role  = true

  # VPC endpoints that are type Gateway
  enable_s3_endpoint       = var.enable_s3_endpoint
  enable_dynamodb_endpoint = var.enable_dynamodb_endpoint

  # VPC endpoints that are type Interface
  enable_ec2_endpoint              = var.enable_ec2_endpoint
  ec2_endpoint_private_dns_enabled = var.ec2_endpoint_private_dns_enabled
  ec2_endpoint_security_group_ids  = [data.aws_security_group.default.id]

  enable_ec2messages_endpoint              = var.enable_ec2messages_endpoint
  ec2messages_endpoint_private_dns_enabled = var.ec2messages_endpoint_private_dns_enabled
  ec2messages_endpoint_security_group_ids  = [data.aws_security_group.default.id]

  enable_ecr_api_endpoint              = var.enable_ecr_api_endpoint
  ecr_api_endpoint_private_dns_enabled = var.ecr_api_endpoint_private_dns_enabled
  ecr_api_endpoint_security_group_ids  = [data.aws_security_group.default.id]

  enable_ecr_dkr_endpoint              = var.enable_ecr_dkr_endpoint
  ecr_dkr_endpoint_private_dns_enabled = var.ecr_dkr_endpoint_private_dns_enabled
  ecr_dkr_endpoint_security_group_ids  = [data.aws_security_group.default.id]

  enable_kms_endpoint              = var.enable_kms_endpoint
  kms_endpoint_private_dns_enabled = var.kms_endpoint_private_dns_enabled
  kms_endpoint_security_group_ids  = [data.aws_security_group.default.id]

  enable_ebs_endpoint              = var.enable_ebs_endpoint
  ebs_endpoint_private_dns_enabled = var.ebs_endpoint_private_dns_enabled
  ebs_endpoint_security_group_ids  = [data.aws_security_group.default.id]

  enable_ec2_autoscaling_endpoint              = var.enable_ec2_autoscaling_endpoint
  ec2_autoscaling_endpoint_private_dns_enabled = var.ec2_autoscaling_endpoint_private_dns_enabled
  ec2_autoscaling_endpoint_security_group_ids  = [data.aws_security_group.default.id]

  enable_ecs_agent_endpoint              = var.enable_ecs_agent_endpoint
  ecs_agent_endpoint_private_dns_enabled = var.ecs_agent_endpoint_private_dns_enabled
  ecs_agent_endpoint_security_group_ids  = [data.aws_security_group.default.id]

  enable_ecs_endpoint              = var.enable_ecs_endpoint
  ecs_endpoint_private_dns_enabled = var.ecs_endpoint_private_dns_enabled
  ecs_endpoint_security_group_ids  = [data.aws_security_group.default.id]

  enable_ecs_telemetry_endpoint              = var.enable_ecs_telemetry_endpoint
  ecs_telemetry_endpoint_private_dns_enabled = var.ecs_telemetry_endpoint_private_dns_enabled
  ecs_telemetry_endpoint_security_group_ids  = [data.aws_security_group.default.id]

  enable_efs_endpoint              = var.enable_efs_endpoint
  efs_endpoint_private_dns_enabled = var.efs_endpoint_private_dns_enabled
  efs_endpoint_security_group_ids  = [data.aws_security_group.default.id]

  enable_elastic_inference_runtime_endpoint              = var.enable_elastic_inference_runtime_endpoint
  elastic_inference_runtime_endpoint_private_dns_enabled = var.elastic_inference_runtime_endpoint_private_dns_enabled
  elastic_inference_runtime_endpoint_security_group_ids  = [data.aws_security_group.default.id]

  enable_elasticbeanstalk_endpoint              = var.enable_elasticbeanstalk_endpoint
  elasticbeanstalk_endpoint_private_dns_enabled = var.elasticbeanstalk_endpoint_private_dns_enabled
  elasticbeanstalk_endpoint_security_group_ids  = [data.aws_security_group.default.id]

  enable_elasticbeanstalk_health_endpoint              = var.enable_elasticbeanstalk_health_endpoint
  elasticbeanstalk_health_endpoint_private_dns_enabled = var.elasticbeanstalk_health_endpoint_private_dns_enabled
  elasticbeanstalk_health_endpoint_security_group_ids  = [data.aws_security_group.default.id]

  enable_elasticloadbalancing_endpoint              = var.enable_elasticloadbalancing_endpoint
  elasticloadbalancing_endpoint_private_dns_enabled = var.elasticloadbalancing_endpoint_private_dns_enabled
  elasticloadbalancing_endpoint_security_group_ids  = [data.aws_security_group.default.id]

  enable_emr_endpoint              = var.enable_emr_endpoint
  emr_endpoint_private_dns_enabled = var.emr_endpoint_private_dns_enabled
  emr_endpoint_security_group_ids  = [data.aws_security_group.default.id]

  enable_events_endpoint              = var.enable_events_endpoint
  events_endpoint_private_dns_enabled = var.events_endpoint_private_dns_enabled
  events_endpoint_security_group_ids  = [data.aws_security_group.default.id]

  enable_git_codecommit_endpoint              = var.enable_git_codecommit_endpoint
  git_codecommit_endpoint_private_dns_enabled = var.git_codecommit_endpoint_private_dns_enabled
  git_codecommit_endpoint_security_group_ids  = [data.aws_security_group.default.id]

  enable_glue_endpoint              = var.enable_glue_endpoint
  glue_endpoint_private_dns_enabled = var.glue_endpoint_private_dns_enabled
  glue_endpoint_security_group_ids  = [data.aws_security_group.default.id]

  enable_kinesis_firehose_endpoint              = var.enable_kinesis_firehose_endpoint
  kinesis_firehose_endpoint_private_dns_enabled = var.kinesis_firehose_endpoint_private_dns_enabled
  kinesis_firehose_endpoint_security_group_ids  = [data.aws_security_group.default.id]

  enable_kinesis_streams_endpoint              = var.enable_kinesis_streams_endpoint
  kinesis_streams_endpoint_private_dns_enabled = var.kinesis_streams_endpoint_private_dns_enabled
  kinesis_streams_endpoint_security_group_ids  = [data.aws_security_group.default.id]

  enable_logs_endpoint              = var.enable_logs_endpoint
  logs_endpoint_private_dns_enabled = var.logs_endpoint_private_dns_enabled
  logs_endpoint_security_group_ids  = [data.aws_security_group.default.id]

  enable_monitoring_endpoint              = var.enable_monitoring_endpoint
  monitoring_endpoint_private_dns_enabled = var.monitoring_endpoint_private_dns_enabled
  monitoring_endpoint_security_group_ids  = [data.aws_security_group.default.id]

  enable_qldb_session_endpoint              = var.enable_qldb_session_endpoint
  qldb_session_endpoint_private_dns_enabled = var.qldb_session_endpoint_private_dns_enabled
  qldb_session_endpoint_security_group_ids  = [data.aws_security_group.default.id]

  enable_rekognition_endpoint              = var.enable_rekognition_endpoint
  rekognition_endpoint_private_dns_enabled = var.rekognition_endpoint_private_dns_enabled
  rekognition_endpoint_security_group_ids  = [data.aws_security_group.default.id]

  enable_sagemaker_api_endpoint              = var.enable_sagemaker_api_endpoint
  sagemaker_api_endpoint_private_dns_enabled = var.sagemaker_api_endpoint_private_dns_enabled
  sagemaker_api_endpoint_security_group_ids  = [data.aws_security_group.default.id]

  enable_sagemaker_notebook_endpoint              = var.enable_sagemaker_notebook_endpoint
  sagemaker_notebook_endpoint_private_dns_enabled = var.sagemaker_notebook_endpoint_private_dns_enabled
  sagemaker_notebook_endpoint_region              = var.sagemaker_notebook_endpoint_region
  sagemaker_notebook_endpoint_security_group_ids  = [data.aws_security_group.default.id]

  enable_sagemaker_runtime_endpoint              = var.enable_sagemaker_runtime_endpoint
  sagemaker_runtime_endpoint_private_dns_enabled = var.sagemaker_runtime_endpoint_private_dns_enabled
  sagemaker_runtime_endpoint_security_group_ids  = [data.aws_security_group.default.id]

  enable_secretsmanager_endpoint              = var.enable_secretsmanager_endpoint
  secretsmanager_endpoint_private_dns_enabled = var.secretsmanager_endpoint_private_dns_enabled
  secretsmanager_endpoint_security_group_ids  = [data.aws_security_group.default.id]

  enable_servicecatalog_endpoint              = var.enable_servicecatalog_endpoint
  servicecatalog_endpoint_private_dns_enabled = var.servicecatalog_endpoint_private_dns_enabled
  servicecatalog_endpoint_security_group_ids  = [data.aws_security_group.default.id]

  enable_ses_endpoint              = var.enable_ses_endpoint
  ses_endpoint_private_dns_enabled = var.ses_endpoint_private_dns_enabled
  ses_endpoint_security_group_ids  = [data.aws_security_group.default.id]

  enable_sms_endpoint              = var.enable_sms_endpoint
  sms_endpoint_private_dns_enabled = var.sms_endpoint_private_dns_enabled
  sms_endpoint_security_group_ids  = [data.aws_security_group.default.id]

  enable_sns_endpoint              = var.enable_sns_endpoint
  sns_endpoint_private_dns_enabled = var.sns_endpoint_private_dns_enabled
  sns_endpoint_security_group_ids  = [data.aws_security_group.default.id]

  enable_sqs_endpoint              = var.enable_sqs_endpoint
  sqs_endpoint_private_dns_enabled = var.sqs_endpoint_private_dns_enabled
  sqs_endpoint_security_group_ids  = [data.aws_security_group.default.id]

  enable_ssm_endpoint              = var.enable_ssm_endpoint
  ssm_endpoint_private_dns_enabled = var.ssm_endpoint_private_dns_enabled
  ssm_endpoint_security_group_ids  = [data.aws_security_group.default.id]

  enable_ssmmessages_endpoint              = var.enable_ssmmessages_endpoint
  ssmmessages_endpoint_private_dns_enabled = var.ssmmessages_endpoint_private_dns_enabled
  ssmmessages_endpoint_security_group_ids  = [data.aws_security_group.default.id]

  enable_states_endpoint              = var.enable_states_endpoint
  states_endpoint_private_dns_enabled = var.states_endpoint_private_dns_enabled
  states_endpoint_security_group_ids  = [data.aws_security_group.default.id]

  enable_storagegateway_endpoint              = var.enable_storagegateway_endpoint
  storagegateway_endpoint_private_dns_enabled = var.storagegateway_endpoint_private_dns_enabled
  storagegateway_endpoint_security_group_ids  = [data.aws_security_group.default.id]

  enable_sts_endpoint              = var.enable_sts_endpoint
  sts_endpoint_private_dns_enabled = var.sts_endpoint_private_dns_enabled
  sts_endpoint_security_group_ids  = [data.aws_security_group.default.id]

  enable_transfer_endpoint              = var.enable_transfer_endpoint
  transfer_endpoint_private_dns_enabled = var.transfer_endpoint_private_dns_enabled
  transfer_endpoint_security_group_ids  = [data.aws_security_group.default.id]

  enable_transferserver_endpoint              = var.enable_transferserver_endpoint
  transferserver_endpoint_private_dns_enabled = var.transferserver_endpoint_private_dns_enabled
  transferserver_endpoint_security_group_ids  = [data.aws_security_group.default.id]

  enable_workspaces_endpoint              = var.enable_workspaces_endpoint
  workspaces_endpoint_private_dns_enabled = var.workspaces_endpoint_private_dns_enabled
  workspaces_endpoint_security_group_ids  = [data.aws_security_group.default.id]

}