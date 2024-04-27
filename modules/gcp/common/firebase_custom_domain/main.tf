terraform {
  required_providers {
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 5.17.0"
    }
  }
}

resource "google_firebase_hosting_custom_domain" "default" {
  provider = google-beta

  project               = var.project_id
  site_id               = var.site_id
  custom_domain         = var.custom_domain
  wait_dns_verification = false
}
