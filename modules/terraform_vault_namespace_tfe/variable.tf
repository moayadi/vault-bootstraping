variable "tfe-organization" {
    description="name of the TFE orgnisation"
}

variable "tfe-workspace-name" {
    description="name of the TFE workspace"
}
variable "github-repo-fullname" {
    description="fullname of github repo"
}

variable "oauth-token-id" {
    description="oauth-token-id assosiated with TFE orgnization"
}

variable "vault-namespace" {
    description="name of the Vault Namesapce"
}

variable "vault-token" {
    description="Vault Token"
}

variable "vault-addr" {
    description="Vault Address"
}

variable "vault-namespace-path" {}

variable "workspace_tags" {
    type = list
}

variable "auto_apply" {
    type = bool
    default = false
}

variable "queue_all_runs" {
    type = bool
    default = false
}