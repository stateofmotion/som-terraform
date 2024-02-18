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