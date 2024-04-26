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
    "firebasestorage.googleapis.com"
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

output "project_number" {
  value = module.org_project.number
}