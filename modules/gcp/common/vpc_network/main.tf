# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network

resource "google_compute_network" "network" {
  auto_create_subnetworks = false
  name                    = var.name
  project                 = var.project_id
}

output "id" {
  value = google_compute_network.network.id
}

output "name" {
  value = google_compute_network.network.name
}
