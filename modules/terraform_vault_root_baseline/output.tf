output "vault-namespace" {
    value=vault_namespace.project-namespace.path
}

output "vault-token" {
    value=vault_token.project-namespace-admin-token.client_token
    sensitive = true
}

output "vault-namespace-id" {
    value=vault_namespace.project-namespace.id
}