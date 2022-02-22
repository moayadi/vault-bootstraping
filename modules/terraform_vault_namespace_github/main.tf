#github repo
resource "github_repository" "githubrepo" {
  name        = var.reponame
  description = "Terraform for Vault code repository for Vault Namespace."

  visibility = "private"
  auto_init = true

//  template {
//    owner = "moayadi"
//    repository = "ws-HR"
//  }
}

resource "github_repository_file" "file_config" {
  for_each       = fileset(path.module, "templates/*")
  repository     = github_repository.githubrepo.name
  file           = trimsuffix(trimprefix(each.value, "templates/"),".tmpl")
    content        = templatefile("${path.module}/${each.value}", {
            lob = var.reponame
        namespace = var.reponame
  })
  commit_message = "Bootstrapping"
}
