# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/vpc_access_connector
# ! This requires vpcaccess.googleapis.com to be enabled

resource "google_vpc_access_connector" "connector" {
  name          = var.name
  machine_type  = var.machine_type
  min_instances = var.min_instances
  max_instances = var.max_instances
  region        = var.region
  
  subnet {
    name = var.subnet_name
  }
  
}

output "connector_id" {
  value = google_vpc_access_connector.connector.id
}

