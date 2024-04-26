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

resource "google_dns_managed_zone" "dns-zone" {
  project     = var.project_id
  name        = var.name
  dns_name    = var.dns_name
  description = var.description
  dnssec_config {
    state = "off"
  }
}