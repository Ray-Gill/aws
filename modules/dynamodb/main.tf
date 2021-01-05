module "table" {
  source = "terraform-aws-modules/dynamodb-table/aws"

  name     = var.name
  hash_key = var.hash_key

  billing_mode = var.billing_mode

  read_capacity  = var.read_capacity
  write_capacity = var.write_capacity

  attributes = var.attributes
}
