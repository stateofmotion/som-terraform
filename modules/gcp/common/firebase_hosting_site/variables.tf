/* 
 * Project ID to apply IAM permissions to.
 */
variable "project_id" {
  type        = string
  description = "The project ID to assign IAM permissions to"
}

/* 
 * Site ID for the hosting site
 */
variable "site_id" {
  type        = string
  description = "Site ID for the hosting site"
}

/* 
 * Firebase hosting site app ID
 */
variable "app_id" {
  type        = string
  description = "Firebase hosting site app ID"
}
