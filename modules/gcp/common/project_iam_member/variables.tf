/* 
    Globally unique project ID that will be used as the
    resource ID within Google Cloud. my-new-project for example
 */
variable "project_id" {
    type = string
    description = "The project ID that must be globally unique"
}

/* 
 * Role to add to the service account
 */
variable "service_account_role" {
    type        = string
    description = "Role to add to the service account"
}

/* 
 * Member to add IAM role to
 */
variable "member" {
    type        = string
    description = "Memeber to add the IAM role to"
}