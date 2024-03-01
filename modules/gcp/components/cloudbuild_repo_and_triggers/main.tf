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

module "repo" {
  source            = "../../common/cloudbuild_repository"
  
  name              = var.repo_name
  parent_connection = var.parent_connection
  project_id        = var.project_id
  region            = var.region
  remote_uri        = var.remote_uri
}

module "build_triggers" {
  source                = "../../common/cloudbuild_trigger"

  for_each              = var.build_triggers != null ? var.build_triggers : tomap({})

  disabled              = each.value.disabled
  filename              = each.value.filename
  name                  = each.value.name
  project_id            = var.project_id
  region                = var.region
  repository_id         = module.repo.remote_uri
  substitutions         = each.value.substitutions
  trigger_match_pattern = each.value.trigger_match_pattern
  trigger_type          = each.value.trigger_type
}