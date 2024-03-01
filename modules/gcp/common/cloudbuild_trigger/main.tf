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

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloudbuild_trigger

resource "google_cloudbuild_trigger" "trigger" {
  provider      = google-beta
  
  disabled      = var.disabled
  filename      = var.filename
  location      = var.region
  name          = var.name
  project       = var.project_id
  substitutions = var.substitutions

  repository_event_config {
    repository = var.repository_id


    dynamic "push" {
      for_each = var.trigger_type == "tag" ? [1] : []

      content {
        tag = var.trigger_match_pattern
      }
    }

    dynamic "push" {
      for_each = var.trigger_type == "branch" ? [1] : []

      content {
        branch = var.trigger_match_pattern
      }
    }
  }
}