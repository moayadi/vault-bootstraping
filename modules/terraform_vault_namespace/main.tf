module "github_repo_module" {
//  source  = "../terraform_vault_namespace_github"
  source  = "app.terraform.io/moayadi/terraform_vault_namespace_github/tfc"
  reponame = "repository-${var.namespace-name}"
}

module "tfe_vault_workspace_module" {
  // source  = "../terraform_vault_namespace_tfe"
  source  = "app.terraform.io/moayadi/terraform_vault_namespace_tfe/tfc"

  github-repo-fullname = "${module.github_repo_module.repoidentifier}"
  //oauth-token-id been hardcoded to the only vcs connection.
  oauth-token-id = "ot-EkzRRJyM6HSLNrxx"
  tfe-organization = "moayadi"
  tfe-workspace-name = "workspace-${module.vault_namespace_baseline_module.vault-namespace}"
  vault-namespace = "${module.vault_namespace_baseline_module.vault-namespace}"
  vault-namespace-path = trimsuffix("${module.vault_namespace_baseline_module.vault-namespace-id}","/")
//  vault-token = "${module.vault_namespace_baseline_module.vault-token}"
  vault-token = var.vault_token
  vault-addr = var.vault-addr
  workspace_tags = var.workspace_tags
  auto_apply = var.auto_apply
  queue_all_runs = var.queue_all_runs
}

module "vault_namespace_baseline_module" {
//  source  = "../terraform_vault_root_baseline"
  source  = "app.terraform.io/moayadi/terraform_vault_root_baseline/tfc"
  namespace = var.namespace-name
}

output "results" {
  value = "Your Vault namespace ${var.namespace-name} has been provisioned successfully.\n You can now commit your terraform code for vault to ${module.github_repo_module.repoidentifier}."

}


