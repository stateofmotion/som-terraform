/* 
 * Project ID to apply IAM permissions to.
 */
variable "project_id" {
  type        = string
  description = "The project ID to assign IAM permissions to"
}

/* 
 * Site ID hosting
 */
variable "site_id" {
  type        = string
  description = "Site ID"
}

/* 
 * Custom domain to use for hosting
 */
variable "custom_domain" {
  type        = string
  description = "Custom domain to use for hosting"
}

/* 
 * Wait DNS
 */
variable "wait_dns_verification" {
  default     = false
  type        = bool
  description = "Custom domain to use for hosting"
}