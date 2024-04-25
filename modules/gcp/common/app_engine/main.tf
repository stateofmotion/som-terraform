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

resource "google_app_engine_application" "app" {
  project     = var.project_id
  location_id = var.location_id
}

output "default_bucket" {
  value = google_app_engine_application.app.default_bucket
}