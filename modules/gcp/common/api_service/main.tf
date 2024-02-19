# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_service

resource "google_project_service" "project" {
  disable_dependent_services = var.disable_dependent_services
  disable_on_destroy         = var.disable_on_destroy
  project                    = var.project_id
  service                    = var.service
}

output "project_id" {
  value = google_project_service.project.project
}