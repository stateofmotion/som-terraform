# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork

resource "google_compute_subnetwork" "subnet" {
  ip_cidr_range = var.ip_cidr_range
  name          = var.name
  network       = var.network_id
  project       = var.project_id
  region        = var.region
}

output "id" {
  value = google_compute_subnetwork.subnet.id
}

output "name" {
  value = google_compute_subnetwork.subnet.name
}