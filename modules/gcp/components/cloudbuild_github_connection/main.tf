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

data "google_project" "project" {
  project_id = var.project_id
}

module "github_access_token" {
  name        = var.github_secret_name
  project_id  = var.project_id
  region      = var.region
  secret_data = var.github_token
  source      = "../secret"
}

module "cloudbuild_service_account_read_iam" {
  source = "../secret_accessor_iam_member"
  secret_id = module.github_access_token.secret_id
  project_id = var.project_id
  member = "serviceAccount:service-${data.google_project.project.number}@gcp-sa-cloudbuild.iam.gserviceaccount.com"
}

module "github_connection" {
  app_installation_id        = var.app_installation_id
  depends_on = [ module.cloudbuild_service_account_read_iam ]
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


