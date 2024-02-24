module "secret_key" {
  name       = var.name
  project_id = var.project_id
  region     = var.region
  source     = "../../common/secret_key"
}

module "secret_value" {
  secret_key_id = module.secret_key.secret_id
  secret_data   = var.secret_data
  source        = "../../common/secret_version"
}

output "data" {
  value = module.secret_value.data
}

output "id" {
  value = module.secret_key.id
}

output "name" {
  value = module.secret_value.name
}

output "secret_id" {
  value = module.secret_key.secret_id
}
