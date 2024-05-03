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

resource "google_project_iam_custom_role" "project_role" {
  count = length(var.permissions) > 0 ? 1 : 0
  
  project     = var.project_id
  role_id     = var.role_id
  title       = "Project Role ${var.role_id}"
  permissions = var.permissions
}

output "role_id" {
  value = google_project_iam_custom_role.project_role.id
}