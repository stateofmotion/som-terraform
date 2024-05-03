terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.17.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 5.17.0"
    }
  }
}

module "org_project" {
  source          = "../../common/org_project"
  name            = var.project_name
  project_id      = var.project_id
  org_id          = var.org_id
  billing_account = var.billing_account
}

module "firebase_project" {
  source = "../../common/firebase_project"
 
  project_id = var.project_id

  depends_on = [ module.terraform_service_account ]
}

module "terraform_service_account" {
  source = "../../common/project_iam_member"
  project_id            = var.project_id
  member                = "serviceAccount:${var.terraform_service_account_email}"
  service_account_role  = var.terraform_service_account_role 

  depends_on = [ module.org_project ]
}

module "api_services" {
  source     = "../../common/api_services"
  
  project_id = module.org_project.project_id
  services   = var.enable_apis

  depends_on = [ module.org_project, module.terraform_service_account ]
}

module "cloudbuild_gserviceaccount_role" {
  source     = "../../common/project_role"
  
  project_id  = module.org_project.project_id
  role_id     = "cloudbuildGserviceaccountRole"
  permissions = var.cloudbuild_gserviceaccount_permissions

  depends_on = [ module.api_services ]
}

module "cloudbuild_gserviceaccount_iam_role_member" {

  count = module.cloudbuild_gserviceaccount_role.role_id != null ? 1 : 0
  source = "../../common/project_iam_member"
 
  project_id           = module.org_project.project_id
  member               = "serviceAccount:${module.org_project.number}@cloudbuild.gserviceaccount.com"
  service_account_role = "projects/${module.org_project.project_id}/roles/${module.cloudbuild_gserviceaccount_role.role_id}"

  depends_on = [ module.cloudbuild_gserviceaccount_role ]
}

# module "cloudbuild_sa_secret_viewer" {
#   source = "github.com/stateofmotion/som-terraform/modules/gcp/common/project_iam_member"

#   project_id            = var.project_id
#   member                = "serviceAccount:${module.firebase.project_number}@cloudbuild.gserviceaccount.com"
#   # ! This should really be narrowed down to the required permissions
#   # ! for the build pipe.
#   service_account_role  = "roles/secretmanager.viewer"

#   depends_on = [ module.cloudbuild_github ]
# }


module "firestore_database" {
  source     = "../../common/firebase_firestore"

  project_id = module.org_project.project_id

  depends_on = [ 
    module.api_services
  ]
}

module "app_engine" {
  source = "../../common/app_engine"
  project_id = module.org_project.project_id

  depends_on = [ 
    module.firestore_database, 
  ]
}

module "firebase_storage_bucket" {
  source = "../../common/firebase_storage_bucket"
 
  project_id = module.org_project.project_id
  bucket_id  = module.app_engine.default_bucket
}

module "idp_config" {
  source = "../../common/identity_platform_config"

  project_id = module.org_project.project_id

  depends_on = [ module.api_services ]
}

module "web_app" {
  source = "../../common/firebase_web_app"

  project_id = module.org_project.project_id

  depends_on = [ module.firebase_project ]
}

data "google_firebase_web_app_config" "basic" {
  provider   = google-beta

  project    = module.org_project.project_id
  web_app_id = module.web_app.app_id
}

module "firebase_hosting_site" {
  source = "../../common/firebase_hosting_site"

  project_id = module.org_project.project_id
  site_id    = "${module.org_project.project_id}-site-app"
  app_id     = module.web_app.app_id
}

module "dns_managed_zone" {
  source = "../../common/dns_managed_zone"

  project_id = module.org_project.project_id
  dns_name   = "${var.domain}."

  depends_on = [ module.api_services ]
}

module "site_dns_a_record" {
  source = "../../common/dns_record_set"

  project_id = var.project_id
  type       = "A"
  name       = "${var.domain}."
  zone_name  = module.dns_managed_zone.name
  rrdatas    = ["199.36.158.100"] # Default firebase A record

  depends_on = [ module.api_services ]
}

module "site_dns_txt_record" {
  source = "../../common/dns_record_set"

  project_id = var.project_id
  type       = "TXT"
  name       = "${var.domain}."
  zone_name  = module.dns_managed_zone.name
  ttl        = 3600
  rrdatas    = concat(
    ["hosting-site=${module.firebase_hosting_site.site_id}"], 
    var.root_dns_txt_records
  )
}

module "site_dns_mx_record" {
  source = "../../common/dns_record_set"

  count = length(var.root_dns_mx_records) > 0 ? 1 : 0

  project_id = var.project_id
  type       = "MX"
  name       = "${var.domain}."
  zone_name  = module.dns_managed_zone.name
  ttl        = 3600
  rrdatas    = var.root_dns_mx_records
}

module "custom_domain" {
  source = "../../common/firebase_custom_domain"

  project_id    = module.org_project.project_id
  site_id       = module.firebase_hosting_site.site_id
  custom_domain = var.domain

  depends_on = [ 
    module.dns_managed_zone
  ]
}

module "simple_secrets" {
  source = "../simple_secrets"

  region        = var.simple_secrets_location
  project_id    = module.org_project.project_id
  secrets       = var.simple_secrets

  depends_on = [ module.api_services ]
}

module "vite_firebase_config_env_vars" {
  source      = "../secret"

  count = var.with_vite_firebase_config == true ? 1 : 0
  
  name        = "VITE_FIREBASE_CONFIG_ENV_VARS"
  project_id  = module.org_project.project_id
  region      = var.simple_secrets_location
  secret_data = <<DATA
VITE_API_KEY=${local.firebase_config.apiKey}
VITE_AUTH_DOMAIN=${local.firebase_config.authDomain}
VITE_PROJECT_ID=${module.org_project.project_id}
VITE_STORAGE_BUCKET=${local.firebase_config.storageBucket}
VITE_MESSAGING_SENDER_ID=${local.firebase_config.messagingSenderId}
VITE_APP_ID=${local.firebase_config.appId}
VITE_DATABASE_URL=${local.firebase_config.databaseURL}
VITE_MEASUREMENT_ID=${local.firebase_config.measurementId}
DATA

depends_on = [ module.api_services ]
}

output "project_id" {
  value = module.org_project.project_id
}

output "project_number" {
  value = module.org_project.number
}

output "app_id" {
  value = module.web_app.app_id
}

output "site_id" {
  value = module.firebase_hosting_site.site_id
}

output "zone_name" {
  value = module.dns_managed_zone.name
}

locals {
  firebase_config = {
    appId              = module.web_app.app_id
    apiKey             = data.google_firebase_web_app_config.basic.api_key
    authDomain         = data.google_firebase_web_app_config.basic.auth_domain
    databaseURL        = lookup(data.google_firebase_web_app_config.basic, "database_url", "")
    storageBucket      = lookup(data.google_firebase_web_app_config.basic, "storage_bucket", "")
    messagingSenderId  = lookup(data.google_firebase_web_app_config.basic, "messaging_sender_id", "")
    measurementId      = lookup(data.google_firebase_web_app_config.basic, "measurement_id", "")
  }
}

output "firebase_config" {
  value = local.firebase_config
}
