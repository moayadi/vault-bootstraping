variable "namespace-name" {
    description="name of the Vault namespace you want to create"
}

variable "vault-addr" {
    description="Address of Vault"
}

variable "workspace_tags" {
    type = list
  
}
variable "vault_token" {}

variable "auto_apply" {}
variable "queue_all_runs" {}
