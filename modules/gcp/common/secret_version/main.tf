# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/secret_manager_secret_version

resource "google_secret_manager_secret_version" "key_version" {
  secret      = var.secret_key_id
  secret_data = var.secret_data
}

output "data" {
  value = google_secret_manager_secret_version.key_version.secret_data
}

output "name" {
  value = google_secret_manager_secret_version.key_version.name
}