variable "tfc_token" {}

variable "github_token" {}

variable "oauth_token_id" {}

variable "tfc_host" {
  default = "app.terraform.io"
}

variable "tfc_org" {
  default = "joestack"
}

variable "pri_key" {}

#variable "aws_region" {
#  description = "AWS region"
#  default     = "eu-west-1"
#}

#variable "name" {
#  description = "Unique name of the deployment"
#  default = "joestack-stm"
#}

#variable "dns_domain" {
#  description = "DNS domain suffix"
#  default     = "joestack.xyz"
#}

#variable "network_address_space" {
#  description = "CIDR for this deployment"
#  default     = "192.168.0.0/16"
#}

