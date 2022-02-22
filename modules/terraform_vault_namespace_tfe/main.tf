  #TFE workspace and variable
resource "tfe_workspace" "project-workspace" {
  name         = var.tfe-workspace-name
  organization = var.tfe-organization
  auto_apply = var.auto_apply
  allow_destroy_plan = true
  queue_all_runs = var.queue_all_runs
  structured_run_output_enabled = true
  tag_names = var.workspace_tags
  vcs_repo  {
   identifier = var.github-repo-fullname
    oauth_token_id = var.oauth-token-id
  }
}

resource "tfe_variable" "project1-workspace-namespace-vault-namespace" {
  workspace_id=tfe_workspace.project-workspace.id
  description="namespace this workspace is bind to"
  category="terraform"
  key="vault_namespace"
  value=var.vault-namespace-path
}

resource "tfe_variable" "project-workspace-namespace-vault-token" {
  workspace_id=tfe_workspace.project-workspace.id
  description="The admin VAULT_TOKEN for this namespace"
  category="terraform"
  key="vault_token"
  value=var.vault-token
  sensitive=true
}

resource "tfe_variable" "project1-workspace-namespace-vault-addr" {
  workspace_id=tfe_workspace.project-workspace.id
  description="The address of Vault"
  category="terraform"
  key="vault_addr"
  value=var.vault-addr
}



