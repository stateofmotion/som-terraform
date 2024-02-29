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

module "repo" {
  name              = var.repo_name
  parent_connection = var.parent_connection
  project_id        = var.project_id
  region            = var.region
  remote_uri        = var.remote_uri
  source            = "../../common/cloudbuild_repository"
}