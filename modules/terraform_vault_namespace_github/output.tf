output "repoidentifier" {
  description="Identifier that can be used in vcs block of TFE provider."
  value=github_repository.githubrepo.full_name
}


