/* 
 * Project ID to apply IAM permissions to.
 */
variable "project_id" {
  type        = string
  description = "The project ID to assign IAM permissions to"
}

/* 
 * Web app display name
 */
variable "display_name" {
  default     = "Web App"
  type        = string
  description = "The web app display name"
}