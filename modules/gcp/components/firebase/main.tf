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

module "terraform_service_account" {
  source = "../../common/project_iam_member"
  project_id            = var.project_id
  member                = "serviceAccount:${var.terraform_service_account_email}"
  service_account_role  = var.terraform_service_account_role 

  depends_on = [ module.org_project ]
}

module "firebase_project" {
  source = "../../common/firebase_project"
 
  project_id = var.project_id

  depends_on = [ module.terraform_service_account ]
}

module "api_services" {
  source     = "../../common/api_services"
  project_id = var.project_id
  services   = [
    "firestore.googleapis.com",
    "firebasestorage.googleapis.com",
    "firebasehosting.googleapis.com",
    "dns.googleapis.com",
    "eventarc.googleapis.com",
    "run.googleapis.com"
  ]

  depends_on = [ module.org_project ]
}

module "firestore_database" {
  source     = "../../common/firebase_firestore"

  project_id = var.project_id

  depends_on = [ 
    module.firebase_project,
    module.api_services
  ]
}

module "app_engine" {
  source = "../../common/app_engine"
  project_id            = var.project_id

  depends_on = [ 
    module.firestore_database, 
  ]
}

module "firebase_storage_bucket" {
  source = "../../common/firebase_storage_bucket"
 
  project_id = var.project_id
  bucket_id  = module.app_engine.default_bucket

  depends_on = [ 
    module.app_engine
  ]
}

module "idp_config" {
  source = "../../common/identity_platform_config"

  project_id = var.project_id

  depends_on = [ module.terraform_service_account]
}

module "web_app" {
  source = "../../common/firebase_web_app"

  project_id = var.project_id

  depends_on = [ module.firebase_project ]
}

data "google_firebase_web_app_config" "basic" {
  provider   = google-beta

  project    = var.project_id
  web_app_id = module.web_app.app_id
}

module "firebase_hosting_site" {
  source = "../../common/firebase_hosting_site"

  project_id = var.project_id
  site_id    = "${var.project_id}-site-app"
  app_id     = module.web_app.app_id

  depends_on = [ module.api_services ]
}

module "dns_managed_zone" {
  source = "../../common/dns_managed_zone"

  project_id = var.project_id
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
}

module "site_dns_txt_record" {
  source = "../../common/dns_record_set"

  project_id = var.project_id
  type       = "TXT"
  name       = "${var.domain}."
  zone_name  = module.dns_managed_zone.name
  rrdatas    = ["hosting-site=${module.firebase_hosting_site.site_id}"] # Default firebase A record
}

module "custom_domain" {
  source = "../../common/firebase_custom_domain"

  project_id    = var.project_id
  site_id       = module.firebase_hosting_site.site_id
  custom_domain = var.domain

  depends_on = [ 
    module.firebase_hosting_site,
    module.dns_managed_zone
  ]
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

output "firebase_config" {
  value = {
    appId              = module.web_app.app_id
    apiKey             = data.google_firebase_web_app_config.basic.api_key
    authDomain         = data.google_firebase_web_app_config.basic.auth_domain
    databaseURL        = lookup(data.google_firebase_web_app_config.basic, "database_url", "")
    storageBucket      = lookup(data.google_firebase_web_app_config.basic, "storage_bucket", "")
    messagingSenderId  = lookup(data.google_firebase_web_app_config.basic, "messaging_sender_id", "")
    measurementId      = lookup(data.google_firebase_web_app_config.basic, "measurement_id", "")
  }
}
