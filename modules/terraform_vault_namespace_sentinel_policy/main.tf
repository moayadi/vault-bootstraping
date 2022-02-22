data "tfe_workspace_ids" "workspaces" {
  tag_names = var.tags
  organization = var.tfe-organization
}

locals {
  workspace_ids = [for r in data.tfe_workspace_ids.workspaces.ids : r]
}

resource "tfe_policy_set" "policyset" {
  name = "vault-namespace-policy-set"
  description = "Policy set applied to all Workspaces managing Vault Namespaces"
  organization = var.tfe-organization
  workspace_ids = local.workspace_ids

  vcs_repo {
   identifier = var.identifier
    oauth_token_id = var.oauth-token-id

  }
}