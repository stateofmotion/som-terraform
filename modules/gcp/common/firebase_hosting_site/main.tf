terraform {
  required_providers {
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 5.17.0"
    }
  }
}

resource "google_firebase_hosting_site" "full" {
  provider = google-beta
  project  = var.project_id
  site_id  = var.site_id
  app_id   = var.app_id
}

output "site_id" {
  value = google_firebase_hosting_site.full.site_id
}