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

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloudbuildv2_connection

resource "google_cloudbuildv2_connection" "default" {
  location = var.region
  name     = var.name
  project  = var.project_id

  github_config {
    app_installation_id = var.app_installation_id

    authorizer_credential {
      oauth_token_secret_version = var.oauth_token_secret_version
    }
  }
}

output "id" {
  value = google_cloudbuildv2_connection.default.id
}