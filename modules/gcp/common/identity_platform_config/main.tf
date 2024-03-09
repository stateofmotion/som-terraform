terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.17.0"
    }
  }
}

resource "google_identity_platform_config" "default" {
  project = var.project_id

  sign_in {
    email {
      enabled           = var.email_signin_enabled
      password_required = var.email_password_required
    }
  }
}
