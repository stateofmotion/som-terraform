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

resource "google_storage_bucket" "default" {
  provider                    = google-beta
  project                     = var.project_id
  name                        = var.name
  location                    = var.location
  uniform_bucket_level_access = var.uniform_bucket_level_access
}

output "bucket_id" {
  value = google_storage_bucket.default.id
}