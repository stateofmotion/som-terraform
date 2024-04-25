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