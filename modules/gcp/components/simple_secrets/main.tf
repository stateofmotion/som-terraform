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

module "simple_secrets" {
  source      = "../secret"

  for_each = var.secrets
  
  name        = each.key
  project_id  = var.project_id
  region      = var.region
  secret_data = each.value
}
