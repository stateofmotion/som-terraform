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

resource "random_string" "bucket_suffix" {
  length  = 6
  special = false
}

module "storage_bucket" {
  source            = "../storage_bucket"
  name              = "${replace(var.project_id, "-", "_")}_bucket_${random_string.bucket_suffix}"
  project_id        = var.project_id
}

resource "google_firebase_storage_bucket" "default" {
  provider  = google-beta
  project   = var.project_id
  bucket_id = module.storage_bucket.bucket_id
}