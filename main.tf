terraform {
  required_version = ">= 0.12"
}

locals {
  secret_access_key = var.aws_secret_access_key
  session_token = var.aws_session_token
  access_key_id = var.aws_access_key_id
}