terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.17.0"
    }
  }
}

resource "google_dns_record_set" "record" {
  project      = var.project_id
  managed_zone = var.zone_name
  name         = var.name
  rrdatas      = var.rrdatas
  ttl          = var.ttl
  type         = var.type
}
