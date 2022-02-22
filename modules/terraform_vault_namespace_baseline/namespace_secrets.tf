resource "vault_generic_endpoint" "passwordpolicy" {
    data_json = <<EOT
{
  "policy": "length = 20\nrule \"charset\" {\n  charset = \"abcde\"\n}\n"
}
            EOT
  path = "sys/policies/password/my-policy"

}

resource "vault_mount" "general_v2" {
    path = "${var.lob}-general"
    type = "kv-v2"
}


resource "vault_mount" "shared_v2" {
    path = "${var.lob}-shared"
    type = "kv-v2"
}


resource "vault_mount" "sensitive_v2" {
    path = "${var.lob}-sensitive"
    type = "kv-v2"
}

resource "vault_mount" "public_v2" {
    path = "${var.lob}-public"
    type = "kv-v2"
}

resource "vault_mount" "new_v2" {
    path = "${var.lob}-new"
    type = "kv-v2"
}


resource "vault_mount" "test_v2" {
    path = "${var.lob}-test"
    type = "kv-v2"
}

resource "vault_mount" "test1_v2" {
    path = "${var.lob}-anothersecretengine"
    type = "kv-v2"
}







