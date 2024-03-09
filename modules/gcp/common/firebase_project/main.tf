terraform {
  required_providers {
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 5.17.0"
    }
  }
}

resource "google_firebase_project" "default" {
  provider = google-beta
  project  = var.project_id
}