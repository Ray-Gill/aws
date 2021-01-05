provider "aws" {
  region = var.region
}

provider "aws" {
  region = var.replication_region
  alias  = "replication"
}

module "state_locking_table" {
  source = "../../dynamodb"

  name     = "${var.bucket_name}-lock"
  hash_key = "LockID"

  read_capacity  = 1
  write_capacity = 1

  attributes = [
    {
      name = "LockID"
      type = "S"
    }
  ]
}

module "s3_policy_state" {
  source = "../iam/policy-document/force-ssl"

  bucket_name = var.bucket_name
}

module "s3_policy_replication" {
  source = "../iam/policy-document/force-ssl"

  bucket_name = var.replication_bucket_name
}

module "replication_role" {
  source = "../iam/replication"

  name                    = var.replication_bucket_name
  bucket_name             = var.bucket_name
  replication_bucket_name = var.replication_bucket_name
}

module "state_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = var.bucket_name
  acl    = "private"

  attach_policy = true
  policy        = module.s3_policy_state.json

  force_destroy = var.force_destroy

  versioning = {
    enabled = true
  }

  server_side_encryption_configuration = {
    rule = {
      apply_server_side_encryption_by_default = {
        sse_algorithm = "AES256"
      }
    }
  }

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

  replication_configuration = {
    role = module.replication_role.role_arn

    rules = [
      {
        id     = "state-replication"
        prefix = ""
        status = "Enabled"

        destination = {
          bucket        = module.state_replication_bucket.this_s3_bucket_arn
          storage_class = "STANDARD"
        }
      }
    ]
  }
}

module "state_replication_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  providers = {
    aws = aws.replication
  }

  bucket = var.replication_bucket_name
  acl    = "private"

  attach_policy = true
  policy        = module.s3_policy_replication.json

  force_destroy = var.force_destroy

  versioning = {
    enabled = true
  }

  server_side_encryption_configuration = {
    rule = {
      apply_server_side_encryption_by_default = {
        sse_algorithm = "AES256"
      }
    }
  }

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
