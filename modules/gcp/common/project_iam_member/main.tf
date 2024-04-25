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


resource "google_project_iam_member" "project" {
  project = var.project_id
  role    = var.service_account_role
  member  = var.member
}

output "id" {
  value =  google_project_iam_member.project.id
}