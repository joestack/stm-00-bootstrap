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


### Creating GitHub Repos ###

resource "github_repository" "stm-10-foundation" {
  name        = "stm-10-foundation"
  description = "My programmatic generated page"
  visibility = "public"
  #auto_init = true
}

resource "github_repository" "stm-20-bastion" {
  name        = "stm-20-bastion"
  description = "My programmatic generated page"
  visibility = "public"
  #auto_init = true
}

resource "github_repository" "stm-30-ptfe" {
  name        = "stm-30-ptfe"
  description = "My programmatic generated page"
  visibility = "public"
  #auto_init = true
}

### Creating TFC Workspaces and connect them to the GitHub Repos ###


resource "tfe_workspace" "stm-10-foundation" {
  name         = "stm-10-foundation"
  organization = "joestack"
  #tag_names    = ["test", "app"]
  vcs_repo {
    identifier = github_repository.stm-10-foundation.full_name
    oauth_token_id = var.oauth_token_id
  }
  allow_destroy_plan = true
  auto_apply = true
  global_remote_state = true 
  queue_all_runs = false  
  terraform_version = "1.0.10" 
}

resource "tfe_workspace" "stm-20-bastion" {
  name         = "stm-20-bastion"
  organization = "joestack"
  #tag_names    = ["test", "app"]
  vcs_repo {
    identifier = github_repository.stm-20-bastion.full_name
    oauth_token_id = var.oauth_token_id
  }
  allow_destroy_plan = true
  auto_apply = true
  global_remote_state = true 
  queue_all_runs = false 
  terraform_version = "1.0.10"
}

resource "tfe_workspace" "stm-30-ptfe" {
  name         = "stm-30-ptfe"
  organization = "joestack"
  #tag_names    = ["test", "app"]
  vcs_repo {
    identifier = github_repository.stm-30-ptfe.full_name
    oauth_token_id = var.oauth_token_id
  }
  allow_destroy_plan = true
  auto_apply = true
  global_remote_state = true 
  queue_all_runs = false 
  terraform_version = "1.0.10"
}
