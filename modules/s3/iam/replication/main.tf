data "aws_iam_policy_document" "s3_assume_role" {
  statement {
    sid = "S3AssumeRole"

    principals {
      type        = "Service"
      identifiers = ["s3.amazonaws.com"]
    }

    effect = "Allow"

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "replication" {
  name        = var.name
  description = "S3 role for replication"

  assume_role_policy = data.aws_iam_policy_document.s3_assume_role.json
}

data "aws_iam_policy_document" "s3_replication" {
  statement {
    sid = "SourceBucketPermissions"

    effect = "Allow"

    actions = [
      "s3:Get*",
      "s3:ListBucket"
    ]

    resources = [
      "arn:aws:s3:::${var.bucket_name}",
      "arn:aws:s3:::${var.bucket_name}/*"
    ]
  }

  statement {
    sid = "ReplicationBucketObjectPermissions"

    effect = "Allow"

    actions = [
      "s3:ReplicateObject",
      "s3:ReplicateDelete",
      "s3:ReplicateTags",
      "s3:GetObjectVersionTagging"
    ]

    resources = ["arn:aws:s3:::${var.replication_bucket_name}/*"]
  }
}

resource "aws_iam_policy" "replication" {
  name        = var.name
  description = "Policy for S3 replication"

  policy = data.aws_iam_policy_document.s3_replication.json
}

resource "aws_iam_policy_attachment" "replication" {
  name       = var.name
  roles      = [aws_iam_role.replication.name]
  policy_arn = aws_iam_policy.replication.arn
}
