### Creating GitHub Repos ###

resource "github_repository" "stm-20-bastion" {
  name        = "stm-20-bastion"
  description = "My programmatic generated page"
  visibility = "public"
  auto_init = true
}

### Creating TFC Workspaces and connect them to the GitHub Repos ###


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

locals {
  bastionhost_priv_ip = cidrhost(aws_subnet.dmz_subnet.cidr_block, 10)
}

resource "aws_security_group" "bastionhost" {
  name        = "${var.name}-bastionhost-sg"
  description = "Bastionhost"
  vpc_id      = aws_vpc.hashicorp_vpc.id
}

resource "aws_security_group_rule" "jh-ssh" {
  security_group_id = aws_security_group.bastionhost.id
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "jh-egress" {
  security_group_id = aws_security_group.bastionhost.id
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

output "bastionhost_subnet_id" {
    value = aws_subnet.dmz_subnet.id
}

output "bastionhost_asg_id" {
  value = aws_security_group.bastionhost.id
}

output "bastionhost_priv_ip" {
  value = local.bastionhost_priv_ip
}
