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

locals {
  description = var.description == null ? "${var.format} repository" : var.description
}

resource "google_artifact_registry_repository" "repository" {
  project       = var.project_id
  location      = var.region

  repository_id = var.repository_id
  description   = local.description
  format        = var.format
}

output "id" {
  value = google_artifact_registry_repository.repository.id
}

output "name" {
  value = google_artifact_registry_repository.repository.name
}
