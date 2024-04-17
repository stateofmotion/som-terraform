/* 
 * Project ID to apply IAM permissions to.
 */
variable "project_id" {
    type        = string
    description = "The project ID to assign IAM permissions to"
}

/* 
 * Service account email
 */
variable "service_account_email" {
    type        = string
    description = "Service account email"
}

/* 
 * Role to add to the service account
 */
variable "service_account_role" {
    type        = string
    description = "Role to add to the service account"
}