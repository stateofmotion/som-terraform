terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.17.0"
    }
  }
}

resource "google_project_iam_policy" "project" {
  project     = var.project_id
  policy_data = data.google_iam_policy.admin.policy_data
}

data "google_iam_policy" "admin" {
  binding {
    role = var.service_account_role

    members = [
      "serviceAccount:${var.service_account_email}",
    ]
  }
}