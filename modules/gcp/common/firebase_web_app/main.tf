terraform {
  required_providers {
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 5.17.0"
    }
  }
}

resource "google_firebase_web_app" "basic" {
  provider     = google-beta
  project      = var.project_id
  display_name = var.display_name
}

output "app_id" {
  value = google_firebase_web_app.basic.app_id
}