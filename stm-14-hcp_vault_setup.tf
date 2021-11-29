resource "github_repository" "stm-14-hcp_vault_setup" {
  name        = "stm-14-hcp_vault_setup"
  description = "My programmatic generated page"
  visibility = "public"
  auto_init = true
}

resource "tfe_workspace" "stm-14-hcp_vault_setup" {
  name         = "stm-14-hcp_vault_setup"
  organization = var.tfc_org
  #tag_names    = ["test", "app"]
  vcs_repo {
    identifier = github_repository.stm-14-hcp_vault_setup.full_name
    oauth_token_id = var.oauth_token_id
  }
  allow_destroy_plan = true
  auto_apply = true
  global_remote_state = true 
  queue_all_runs = false  
  terraform_version = "1.0.10" 
}