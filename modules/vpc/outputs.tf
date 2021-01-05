output "azs" {
  value = module.vpc.azs
}

output "cgw_ids" {
  value = module.vpc.cgw_ids
}

output "igw_id" {
  value = module.vpc.igw_id
}

output "name" {
  value = module.vpc.name
}

output "nat_ids" {
  value = module.vpc.nat_ids
}

output "nat_public_ips" {
  value = module.vpc.nat_public_ips
}

output "natgw_ids" {
  value = module.vpc.natgw_ids
}

output "private_subnets" {
  value = module.vpc.private_subnets
}

output "private_route_table_ids" {
  value = module.vpc.private_route_table_ids
}

output "private_subnets_cidr_blocks" {
  value = module.vpc.private_subnets_cidr_blocks
}

output "public_subnets" {
  value = module.vpc.public_subnets
}

output "public_route_table_ids" {
  value = module.vpc.public_route_table_ids
}

output "public_subnets_cidr_blocks" {
  value = module.vpc.public_subnets_cidr_blocks
}

output "intra_subnets" {
  value = module.vpc.intra_subnets
}

output "intra_route_table_ids" {
  value = module.vpc.intra_route_table_ids
}

output "intra_subnets_cidr_blocks" {
  value = module.vpc.intra_subnets_cidr_blocks
}

output "elasticache_subnets" {
  value = module.vpc.elasticache_subnets
}

output "elasticache_route_table_ids" {
  value = module.vpc.elasticache_route_table_ids
}

output "elasticache_subnets_cidr_blocks" {
  value = module.vpc.elasticache_subnets_cidr_blocks
}

output "database_subnets" {
  value = module.vpc.database_subnets
}

output "database_route_table_ids" {
  value = module.vpc.database_route_table_ids
}

output "database_subnets_cidr_blocks" {
  value = module.vpc.database_subnets_cidr_blocks
}

output "redshift_subnets" {
  value = module.vpc.redshift_subnets
}

output "redshift_route_table_ids" {
  value = module.vpc.redshift_route_table_ids
}

output "redshift_subnets_cidr_blocks" {
  value = module.vpc.redshift_subnets_cidr_blocks
}

output "default_security_group_id" {
  value = module.vpc.default_security_group_id
}

output "customer_gateway" {
  value = module.vpc.this_customer_gateway
}

output "vgw_id" {
  value = module.vpc.vgw_id
}

output "vpc_arn" {
  value = module.vpc.vpc_arn
}

output "vpc_cidr_block" {
  value = module.vpc.vpc_cidr_block
}

output "vpc_enable_dns_hostnames" {
  value = module.vpc.vpc_enable_dns_hostnames
}

output "vpc_enable_dns_support" {
  value = module.vpc.vpc_enable_dns_support
}

output "vpc_flow_log_cloudwatch_iam_role_arn" {
  value = module.vpc.vpc_flow_log_cloudwatch_iam_role_arn
}

output "vpc_flow_log_destination_arn" {
  value = module.vpc.vpc_flow_log_destination_arn
}

output "vpc_flow_log_destination_type" {
  value = module.vpc.vpc_flow_log_destination_type
}

output "vpc_flow_log_id" {
  value = module.vpc.vpc_flow_log_id
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "vpc_instance_tenancy" {
  value = module.vpc.vpc_instance_tenancy
}

output "vpc_main_route_table_id" {
  value = module.vpc.vpc_main_route_table_id
}

output "vpc_owner_id" {
  value = module.vpc.vpc_owner_id
}

output "vpc_secondary_cidr_blocks" {
  value = module.vpc.vpc_secondary_cidr_blocks
}

output "vpc_endpoint_dynamodb_id" {
  value = module.vpc.vpc_endpoint_dynamodb_id
}

output "vpc_endpoint_s3_id" {
  value = module.vpc.vpc_endpoint_s3_id
}

output "vpc_endpoint_access_analyzer_id" {
  value = module.vpc.vpc_endpoint_access_analyzer_id
}

output "vpc_endpoint_acm_pca_id" {
  value = module.vpc.vpc_endpoint_acm_pca_id
}

output "vpc_endpoint_apigw_id" {
  value = module.vpc.vpc_endpoint_apigw_id
}

output "vpc_endpoint_appmesh_envoy_management_id" {
  value = module.vpc.vpc_endpoint_appmesh_envoy_management_id
}

output "vpc_endpoint_appstream_api_id" {
  value = module.vpc.vpc_endpoint_appstream_api_id
}

output "vpc_endpoint_appstream_streaming_id" {
  value = module.vpc.vpc_endpoint_appstream_streaming_id
}

output "vpc_endpoint_athena_id" {
  value = module.vpc.vpc_endpoint_athena_id
}

output "vpc_endpoint_auto_scaling_plans_id" {
  value = module.vpc.vpc_endpoint_auto_scaling_plans_id
}

output "vpc_endpoint_cloud_directory_id" {
  value = module.vpc.vpc_endpoint_cloud_directory_id
}

output "vpc_endpoint_cloudformation_id" {
  value = module.vpc.vpc_endpoint_cloudformation_id
}

output "vpc_endpoint_cloudtrail_id" {
  value = module.vpc.vpc_endpoint_cloudtrail_id
}

output "vpc_endpoint_codebuild_id" {
  value = module.vpc.vpc_endpoint_codebuild_id
}

output "vpc_endpoint_codecommit_id" {
  value = module.vpc.vpc_endpoint_codecommit_id
}

output "vpc_endpoint_codepipeline_id" {
  value = module.vpc.vpc_endpoint_codepipeline_id
}

output "vpc_endpoint_config_id" {
  value = module.vpc.vpc_endpoint_config_id
}

output "vpc_endpoint_datasync_id" {
  value = module.vpc.vpc_endpoint_datasync_id
}

output "vpc_endpoint_ebs_id" {
  value = module.vpc.vpc_endpoint_ebs_id
}

output "vpc_endpoint_ec2_autoscaling_id" {
  value = module.vpc.vpc_endpoint_ec2_autoscaling_id
}

output "vpc_endpoint_ec2_id" {
  value = module.vpc.vpc_endpoint_ec2_id
}

output "vpc_endpoint_ec2messages_id" {
  value = module.vpc.vpc_endpoint_ec2messages_id
}

output "vpc_endpoint_ecr_api_id" {
  value = module.vpc.vpc_endpoint_ecr_api_id
}

output "vpc_endpoint_ecr_dkr_id" {
  value = module.vpc.vpc_endpoint_ecr_dkr_id
}

output "vpc_endpoint_ecs_agent_id" {
  value = module.vpc.vpc_endpoint_ecs_agent_id
}

output "vpc_endpoint_ecs_id" {
  value = module.vpc.vpc_endpoint_ecs_id
}

output "vpc_endpoint_ecs_telemetry_id" {
  value = module.vpc.vpc_endpoint_ecs_telemetry_id
}

output "vpc_endpoint_efs_id" {
  value = module.vpc.vpc_endpoint_efs_id
}

output "vpc_endpoint_elastic_inference_runtime_id" {
  value = module.vpc.vpc_endpoint_elastic_inference_runtime_id
}

output "vpc_endpoint_elasticbeanstalk_health_id" {
  value = module.vpc.vpc_endpoint_elasticbeanstalk_health_id
}

output "vpc_endpoint_elasticbeanstalk_id" {
  value = module.vpc.vpc_endpoint_elasticbeanstalk_id
}

output "vpc_endpoint_elasticloadbalancing_id" {
  value = module.vpc.vpc_endpoint_elasticloadbalancing_id
}

output "vpc_endpoint_elasticmapreduce_id" {
  value = module.vpc.vpc_endpoint_elasticmapreduce_id
}

output "vpc_endpoint_events_id" {
  value = module.vpc.vpc_endpoint_events_id
}

output "vpc_endpoint_glue_id" {
  value = module.vpc.vpc_endpoint_glue_id
}

output "vpc_endpoint_kinesis_firehose_id" {
  value = module.vpc.vpc_endpoint_kinesis_firehose_id
}

output "vpc_endpoint_kinesis_streams_id" {
  value = module.vpc.vpc_endpoint_kinesis_streams_id
}

output "vpc_endpoint_kms_id" {
  value = module.vpc.vpc_endpoint_kms_id
}

output "vpc_endpoint_logs_id" {
  value = module.vpc.vpc_endpoint_logs_id
}

output "vpc_endpoint_monitoring_id" {
  value = module.vpc.vpc_endpoint_monitoring_id
}

output "vpc_endpoint_qldb_session_id" {
  value = module.vpc.vpc_endpoint_qldb_session_id
}

output "vpc_endpoint_rekognition_id" {
  value = module.vpc.vpc_endpoint_rekognition_id
}

output "vpc_endpoint_sagemaker_api_id" {
  value = module.vpc.vpc_endpoint_sagemaker_api_id
}

output "vpc_endpoint_sagemaker_runtime_id" {
  value = module.vpc.vpc_endpoint_sagemaker_runtime_id
}

output "vpc_endpoint_secretsmanager_id" {
  value = module.vpc.vpc_endpoint_secretsmanager_id
}

output "vpc_endpoint_servicecatalog_id" {
  value = module.vpc.vpc_endpoint_servicecatalog_id
}

output "vpc_endpoint_ses_id" {
  value = module.vpc.vpc_endpoint_ses_id
}

output "vpc_endpoint_sms_id" {
  value = module.vpc.vpc_endpoint_sms_id
}

output "vpc_endpoint_sns_id" {
  value = module.vpc.vpc_endpoint_sns_id
}

output "vpc_endpoint_sqs_id" {
  value = module.vpc.vpc_endpoint_sqs_id
}

output "vpc_endpoint_ssm_id" {
  value = module.vpc.vpc_endpoint_ssm_id
}

output "vpc_endpoint_ssmmessages_id" {
  value = module.vpc.vpc_endpoint_ssmmessages_id
}

output "vpc_endpoint_states_id" {
  value = module.vpc.vpc_endpoint_states_id
}

output "vpc_endpoint_storagegateway_id" {
  value = module.vpc.vpc_endpoint_storagegateway_id
}

output "vpc_endpoint_sts_id" {
  value = module.vpc.vpc_endpoint_sts_id
}

output "vpc_endpoint_transfer_id" {
  value = module.vpc.vpc_endpoint_transfer_id
}

output "vpc_endpoint_transferserver_id" {
  value = module.vpc.vpc_endpoint_transferserver_id
}

output "vpc_endpoint_workspaces_id" {
  value = module.vpc.vpc_endpoint_workspaces_id
}
