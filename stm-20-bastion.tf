resource "github_repository" "stm-20-bastion" {
  name        = "stm-20-bastion"
  description = "My programmatic generated page"
  visibility = "public"
  auto_init = true
}
#### WORKSPACE stm-20 ###
resource "tfe_workspace" "stm-20-bastion" {
  name         = "stm-20-bastion"
  organization = var.tfc_org
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

resource "tfe_variable" "aws_region-20" {
  key          = "aws_region"
  value        = var.aws_region
  category     = "terraform"
  workspace_id = tfe_workspace.stm-20-bastion.id
  description  = "AWS Region to be used"
}

resource "tfe_variable" "pri_key" {
  key          = "pri_key"
  value        = var.pri_key
  category     = "terraform"
  sensitive    = true
  workspace_id = tfe_workspace.stm-20-bastion.id
  description  = "Private Key to connect to the bastionhost"
}
