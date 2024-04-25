/* 
  Globally unique project ID that will be used as the
  resource ID within Google Cloud. my-new-project for example
 */
variable "project_id" {
  description = "The project ID that must be globally unique"
  type = string
}

/* 
  Storage bucket name. This must be globally unique
 */
variable "name" {
  description = "User friendly name of the project. Not the project ID"
  type        = string
}

/* 
  Region of to create the VPC in. Required since this depends on
  where the resources are deployed.
 */
variable "location" {
  default     = "US"
  description = "Location to create the storage bucket"
  type        = string
}

/* 
  Uniform bucket level access
 */
variable "uniform_bucket_level_access" {
  default     = true
  description = "Uniform bucket level access"
  type        = bool
}