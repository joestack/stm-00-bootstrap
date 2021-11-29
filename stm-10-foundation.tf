resource "github_repository" "stm-10-foundation" {
  name        = "stm-10-foundation"
  description = "My programmatic generated page"
  visibility = "public"
  auto_init = true
}

#### WORKSPACE stm-10 ###

resource "tfe_workspace" "stm-10-foundation" {
  name         = "stm-10-foundation"
  organization = var.tfc_org
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

resource "tfe_variable" "aws_region-10" {
  key          = "aws_region"
  value        = var.aws_region
  category     = "terraform"
  workspace_id = tfe_workspace.stm-10-foundation.id
  description  = "AWS Region to be used"
}

// add foundation Variables 
// secrets from variables.csv