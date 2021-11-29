resource "github_repository" "stm-30-ptfe" {
  name        = "stm-30-ptfe"
  description = "My programmatic generated page"
  visibility = "public"
  auto_init = true
}

#### WORKSPACE stm-30 ###

resource "tfe_workspace" "stm-30-ptfe" {
  name         = "stm-30-ptfe"
  organization = var.tfc_org
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