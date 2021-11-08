terraform {
  required_version = ">= 0.13"
  required_providers {
    tfe = {
      version = "~> 0.26.0"
    }
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
  }
}

provider "tfe" {
  hostname = var.tfc_host
  token    = var.tfc_token
  #version  = "~> 0.26.0"
}

provider "github" {
  token = var.github_token
}

resource "github_repository" "example" {
  name        = "tf-provider-example"
  description = "My programmatic generated page"
 
  visibility = "public"

  auto_init = true

}

# resource "tfe_workspace" "stm-10-foundation" {
#   name         = "stm-10-foundation"
#   organization = "joestack"
#   #tag_names    = ["test", "app"]
# }

