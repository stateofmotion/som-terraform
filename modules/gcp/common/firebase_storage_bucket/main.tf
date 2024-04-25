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

# resource "random_string" "bucket_suffix" {
#   length  = 6
#   special = false
# }

# module "storage_bucket" {
#   source            = "../storage_bucket"
#   name              = "${replace(var.project_id, "-", "_")}_bucket_${lower(random_string.bucket_suffix.result)}"
#   project_id        = var.project_id
# }

resource "google_firebase_storage_bucket" "default" {
  provider  = google-beta
  project   = var.project_id
  bucket_id = var.bucket_id
}