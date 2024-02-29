terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.17.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 5.17.0"
    }
  }
}

module "github_access_token" {
  name        = var.github_secret_name
  project_id  = var.project_id
  region      = var.region
  secret_data = var.github_token
  source      = "../secret"
}

module "github_connection" {
  app_installation_id        = var.app_installation_id
  name                       = var.name
  oauth_token_secret_version = module.github_access_token.name
  project_id                 = var.project_id
  region                     = var.region
  source                     = "../../common/cloudbuild_github_connector"
}

output "github_connection_id" {
  value = module.github_connection.id
}

output "secret_id" {
  value = module.github_access_token.secret_id
}

output "secret_name" {
  value = module.github_access_token.secret_id
}


