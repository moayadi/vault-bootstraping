output "github-repo-url" {
    value="${module.github_repo_module.repoidentifier}"
}

output "vault_path" {
    value = module.vault_namespace_baseline_module.vault-namespace
}

