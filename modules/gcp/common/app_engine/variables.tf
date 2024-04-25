/* 
 * Project ID to apply IAM permissions to.
 */
variable "project_id" {
  type        = string
  description = "The project ID to assign IAM permissions to"
}

/* 
 * Location ID of the app engine. Defaults to us-central which is multi-region.
 */
variable "location_id" {
  default     = "us-central"
  type        = string
  description = "Location ID of the app engine. Defaults to us-central which is multi-region"
}