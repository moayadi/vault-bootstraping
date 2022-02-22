resource "vault_auth_backend" "kubernetes" {
  path = "${lob}-kubernetes"
  type = "kubernetes"
}