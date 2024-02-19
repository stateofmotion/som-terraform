module "github_access_token" {
  source      = "../secret"
  project_id  = var.project_id
  region      = var.region
  name        = var.github_secret_name
  secret_data = var.github_token
}

module "github_connection" {
  source                     = "../../common/cloudbuild_github_connector"
  app_installation_id        = var.app_installation_id
  project_id                 = var.project_id
  oauth_token_secret_version = module.github_access_token.name
  region                     = var.region
}