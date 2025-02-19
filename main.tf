terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

variable "github_token" {
  description = "GitHub Personal Access Token"
  type        = string
  sensitive   = true
}

provider "github" {
  token = var.github_token
}

resource "github_repository" "repo-terraform" {
  name        = "repo-terraform"
  description = "Repositorio creado para laboratorio de IaC con Terraform."
  visibility  = "public"
  auto_init   = true
}

resource "github_branch" "development" {
  repository = github_repository.sender-repo-tf.name
  branch     = "development"
}

resource "github_branch" "feature" {
  repository = github_repository.sender-repo-tf.name
  branch     = "feature"
}

resource "github_branch" "hotfix" {
  repository = github_repository.sender-repo-tf.name
  branch     = "hotfix"
}
