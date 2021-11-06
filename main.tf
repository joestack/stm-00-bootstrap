terraform {
  required_version = ">= 0.12"
}

variable "tfc_token" {}

output "tfc_token" {
  value = var.tfc_token
  sensitive = true
}