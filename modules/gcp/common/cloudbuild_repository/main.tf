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

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloudbuildv2_repository

resource "google_cloudbuildv2_repository" "repository" {
  project           = var.project_id
  provider          = google-beta
  location          = var.region
  name              = var.name
  parent_connection = var.parent_connection
  remote_uri        = var.remote_uri
}

output "id" {
  value = google_cloudbuildv2_repository.repository.id
}

output "name" {
  value = google_cloudbuildv2_repository.repository.name
}

output "remote_uri" {
  value = google_cloudbuildv2_repository.repository.remote_uri
}
