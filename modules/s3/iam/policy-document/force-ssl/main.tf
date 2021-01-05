data "aws_iam_policy_document" "bucket_policy_force_ssl" {
  statement {
    sid = "S3SecureTransportPolicy"

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    effect = "Deny"

    actions = ["s3:*"]

    resources = [
      "arn:aws:s3:::${var.bucket_name}/*"
    ]

    condition {
      test     = "Bool"
      variable = "aws:SecureTransport"
      values   = ["false"]
    }
  }
}
