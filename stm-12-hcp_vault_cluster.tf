resource "github_repository" "stm-12-hcp_vault_cluster" {
  name        = "stm-12-hcp_vault_cluster"
  description = "My programmatic generated page"
  visibility = "public"
  auto_init = true
}

resource "tfe_workspace" "stm-12-hcp_vault_cluster" {
  name         = "stm-12-hcp_vault_cluster"
  organization = var.tfc_org
  #tag_names    = ["test", "app"]
  vcs_repo {
    identifier = github_repository.stm-12-hcp_vault_cluster.full_name
    oauth_token_id = var.oauth_token_id
  }
  allow_destroy_plan = true
  auto_apply = true
  global_remote_state = true 
  queue_all_runs = false  
  terraform_version = "1.0.10" 
}

resource "tfe_variable" "hcp_client_id" {
  key          = "client_id"
  value        = var.hcp_client_id
  category     = "terraform"
  sensitive    = true
  workspace_id = tfe_workspace.stm-12-hcp_vault_cluster.id
  description  = "HCP Client ID"
}

resource "tfe_variable" "hcp_client_secret" {
  key          = "client_secret"
  value        = var.hcp_client_secret
  category     = "terraform"
  sensitive    = true
  workspace_id = tfe_workspace.stm-12-hcp_vault_cluster.id
  description  = "HCP Client Secret"
}
