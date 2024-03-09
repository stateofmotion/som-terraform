/* 
 *  Email sign-in enabled
 */
variable "email_signin_enabled" {
  default     = true
  description = "Email sign-in enabled"
  type        = bool
}

/* 
 * Password required for email sign-in. If this is disabled a user
 * could still sign in with an email link.
 */
variable "email_password_required" {
  default     = true
  description = "Require a password for email sign in."
  type        = bool
}

/* 
 * Project ID
 */
variable "project_id" {
  description = "Project ID"
  type        = string
}