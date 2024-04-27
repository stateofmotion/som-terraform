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

resource "random_string" "zone_suffix" {
  length  = 6
  special = false
}

resource "google_dns_managed_zone" "dns_zone" {
  project     = var.project_id
  name        = "${var.name}_${lower(random_string.zone_suffix.result)}"
  dns_name    = var.dns_name
  description = var.description
  dnssec_config {
    state = "off"
  }
}

output "name" {
  value = google_dns_managed_zone.dns_zone.name
}