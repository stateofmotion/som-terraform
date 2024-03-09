terraform {
  required_providers {
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 5.17.0"
    }
  }
}

resource "google_firestore_database" "database" {
  provider    = google-beta
  project     = var.project_id
  name        = var.name
  location_id = var.location_id
  type        = var.type
}

output "id" {
  value = google_firestore_database.database.id
}

output "uid" {
  value = google_firestore_database.database.uid
}