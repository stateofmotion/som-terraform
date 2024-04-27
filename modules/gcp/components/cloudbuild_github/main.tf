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

module "api_services" {
  source     = "../../common/api_services"
  project_id = var.project_id
  services   = [
    "secretmanager.googleapis.com",
    "cloudbuild.googleapis.com"
  ]
}

module "my_github_cloudbuild_connection" {
  app_installation_id = var.app_installation_id
  github_token        = var.github_token
  project_id          = var.project_id
  region              = var.region
  source              = "../cloudbuild_github_connection"

  depends_on = [ module.api_services ]
}

module "repo_and_triggers" {
  source              = "../cloudbuild_repo_and_triggers"
  
  for_each            = var.repositories

  build_triggers      = each.value.build_triggers
  parent_connection   = module.my_github_cloudbuild_connection.github_connection_id
  project_id          = var.project_id
  region              = var.region
  remote_uri          = each.value["remote_uri"]
  repo_name           = each.key
}