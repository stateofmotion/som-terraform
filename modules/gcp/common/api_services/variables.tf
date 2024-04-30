/* 
   Project ID
 */
variable "project_id" {
  description = "Project ID"
  type        = string
}

/* 
  GCP service to enable, i.e. "run.googleapis.com",
 */
variable "services" {
  description = "GCP services to enable"
  type        = list(string)
}

/* 
  Disable dependent APIs when using tf destroy
 */
variable "disable_on_destroy" {
  default     = false
  description = "Disable dependent apis when running tf destroy an api"
  type        = bool
}

/* 
  Disable dependent APIs when using tf destroy
 */
variable "disable_dependent_services" {
  default     = false
  description = "Disable dependent apis when running tf destroy an api"
  type        = bool
}