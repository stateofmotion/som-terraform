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

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/secret_manager_secret

resource "google_secret_manager_secret" "key" {
  secret_id = var.name
  project   = var.project_id

  replication {
    user_managed {
      replicas {
        location = var.region
      }
    }
  }
}

output "id" {
  value = google_secret_manager_secret.key.id
}

output "secret_id" {
  value = google_secret_manager_secret.key.secret_id
}