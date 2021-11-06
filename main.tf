terraform {
  required_version = ">= 0.13"
  required_providers {
    tfe = {
      version = "~> 0.26.0"
    }
  }
}

provider "tfe" {
  #hostname = var.hostname
  token    = var.tfc_token
  #version  = "~> 0.26.0"
}

resource "tfe_workspace" "test" {
  name         = "stm-10-foundation"
  organization = "joestack"
  #tag_names    = ["test", "app"]
}


variable "tfc_token" {}

output "tfc_token" {
  value = var.tfc_token
  sensitive = true
}


