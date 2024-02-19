# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_run_v2_service

resource "google_cloud_run_v2_service" "default" {
  ingress  = var.ingress
  location = var.region
  name     = var.name
  project  = var.project_id

  template {
    containers {
      image = var.image

      resources {
        limits = {
          cpu    = var.cpu
          memory = var.memory
        }
      }
    }
    
    dynamic "vpc_access" {
      for_each = var.vpc_connection_id != null ? [{connector_id = var.vpc_connection_id}] : []

      content {
        connector = vpc_access.value["connector_id"]
        egress = "ALL_TRAFFIC"
      }
    }
  }
}

resource "google_cloud_run_service_iam_binding" "default" {
  project  = var.project_id
  count    = var.allow_unauthenticated ? 1 : 0
  location = google_cloud_run_v2_service.default.location
  service  = google_cloud_run_v2_service.default.name
  role     = "roles/run.invoker"
  members = [
    "allUsers"
  ]
}

output "name" {
  value = google_cloud_run_v2_service.default.name
}

output "uri" {
  value = google_cloud_run_v2_service.default.uri
}

