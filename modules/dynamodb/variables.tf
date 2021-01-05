variable "name" {
  type = string
}

variable "hash_key" {
  type    = string
  default = null
}

variable "billing_mode" {
  type        = string
  description = "The valid values are PROVISIONED or PAY_PER_REQUEST"
  default     = "PROVISIONED"

  validation {
    condition     = can(index(["PROVISIONED", "PAY_PER_REQUEST"], var.billing_mode))
    error_message = "Invalid Billing Mode."
  }
}

variable "read_capacity" {
  type    = number
  default = 1
}

variable "write_capacity" {
  type    = number
  default = 1
}

variable "attributes" {
  type = list(map(string))
}
