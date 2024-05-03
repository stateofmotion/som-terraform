/* 
 * Project ID to apply IAM permissions to.
 */
variable "project_id" {
  type        = string
  description = "The project ID to assign IAM permissions to"
}

/* 
 * Project ID to apply IAM permissions to.
 */
variable "project_name" {
  type        = string
  description = "The project ID to assign IAM permissions to"
}

/* 
 *  Billing account associated with the project. This will be found in "billing"
 *  section of the console under "Billing account ID"
 */
variable "billing_account" {
  type        = string
  default     = null
  description = "Billing account ID. Found in the 'billing' section under 'Billing account Id'"
}

/* 
 * The organization that the project should be created in.
 */
variable "org_id" {
  type = string
  description = "Organization ID"
}

/* 
 * Terraform service account responsible for the resources. This module
 * is intended to have a service account ready before the project initialization
 * which means the service account will likely need to come from a surrogate project
 * and have IAM roles at the org level.
 */
variable "terraform_service_account_email" {
  type        = string
  description = "Terraform service account responsible for resources"
}

/* 
 * This is the role that will be assigned to the service account that manages the
 * project. While the role itself can be terraformed. The usage here is intended to
 * to be with a pre-existing role. 
 */
variable "terraform_service_account_role" {
  type        = string
  description = "Terraform service account role for governing the terraform resources"
}

# /* 
#  * Custom URL
#  */
# variable "custom_domain" {
#   description = "Custom domain to use for hosting"
#   type        = string
# }

/* 
 * Domain name. This is the root of the domain to use in
 * in the google zone.
 */
variable "domain" {
  description = "Domain name. This is the root of the domain to use in the google zone."
  type        = string
}

/*
 * Map of simple secrets to add in
 */
variable "simple_secrets" {
  default     = {}
  type        = map(string)
  description = "Map of simple secrets to add in"
}

variable "cloudbuild_gserviceaccount_permissions" {
  default     = []
  type        = list(string)
  description = "Permissions that need to be added to the @cloudbuild.gserviceaccount.com"
}

variable "gcp_sa_cloudbuild_permissions" {
  default     = []
  type        = list(string)
  description = "Permissions to add to the @gcp-sa-cloudbuild.iam.gserviceaccount.com service account"
}

/*
 * Location for simple secrets location
 */
variable "simple_secrets_location" {
  default     = "us-central1"
  type        = string
  description = "Location for simple secrets location"
}

/*
 * Location for simple secrets location
 */
variable "enable_apis" {
  type        = list(string)
  description = "APIS to enable"
}

/*
 * Location for simple secrets location
 */
variable "with_vite_firebase_config" {
  default     = true
  type        = bool
  description = "Automatically create a secret with Vite env vars for firebase config"
}

/*
 * Root domain TXT records
 */
variable "root_dns_txt_records" {
  default     = []
  type        = list(string)
  description = "Root domain TXT records"
}

/*
 * Root MX records
 */
variable "root_dns_mx_records" {
  default     = []
  type        = list(string)
  description = "Root domain MX records"
}