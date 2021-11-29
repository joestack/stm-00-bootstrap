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

resource "tfe_variable" "vault_admin_pw" {
  key          = "vault_admin_pw"
  value        = var.vault_admin_pw
  category     = "terraform"
  sensitive    = true
  workspace_id = tfe_workspace.stm-14-hcp_vault_setup.id
  description  = "Vault Admin password"
}