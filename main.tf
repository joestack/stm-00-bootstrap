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
}

provider "github" {
  token = var.github_token
}



### Creating GitHub Repos ###

resource "github_repository" "stm-10-foundation" {
  name        = "stm-10-foundation"
  description = "My programmatic generated page"
  visibility = "public"
  auto_init = true
}

resource "github_repository" "stm-20-bastion" {
  name        = "stm-20-bastion"
  description = "My programmatic generated page"
  visibility = "public"
  auto_init = true
}

resource "github_repository" "stm-30-ptfe" {
  name        = "stm-30-ptfe"
  description = "My programmatic generated page"
  visibility = "public"
  auto_init = true
}

### Creating TFC Workspaces and connect them to the GitHub Repos ###
### adding Variables to Workspaces

#### WORKSPACE stm-10 ###

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

resource "tfe_variable" "aws_region" {
  key          = "aws_region"
  value        = var.aws_region
  category     = "terraform"
  sensitive    = true
  workspace_id = tfe_workspace.stm-10-foundation.id
  description  = "AWS Region to be used"
}

// add foundation Variables 
// secrets from variables.csv

#### WORKSPACE stm-20 ###
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
// add bastion Variables 
// secrets from variables.csv

resource "tfe_variable" "pri_key" {
  key          = "pri_key"
  value        = var.pri_key
  category     = "terraform"
  sensitive    = true
  workspace_id = tfe_workspace.stm-20-bastion.id
  description  = "Private Key to connect to the bastionhost"
}

#### WORKSPACE stm-30 ###

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

// add ptfe Variables 
// secrets from variables.csv
