/*
  Create a new GCP project within an organization given the
  organization ID
*/
resource "google_project" "org_project" {
  name                = var.name
  project_id          = var.project_id
  org_id              = var.org_id
  auto_create_network = var.auto_create_network
}

output "project_id" {
  value = google_project.org_project.project_id
}

output "name" {
  value = google_project.org_project.name
}

output "number" {
  value = google_project.org_project.number
}

output "org_id" {
  value = google_project.org_project.auto_create_network
}

