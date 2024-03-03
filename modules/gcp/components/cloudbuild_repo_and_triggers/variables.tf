/* 
   Repository name
 */
variable "repo_name" {
  description = "Name of the repository"
  type = string
}

/* 
   Parent connection. This comes from the resource ID from the
   google_cloudbuildv2_connection resource. i.e.
   google_cloudbuildv2_connection.[NAME].id
 */
variable "parent_connection" {
  description = "Parent connection. This comes from the resource ID from the google_cloudbuildv2_connection"
  type = string
}

/* 
   Project ID
 */
variable "project_id" {
  description = "Project ID"
  type = string
}

/* 
   Region to create the Cloud RUn service in
 */
variable "region" {
  description = "Region to create the Cloud Run service in"
  type        = string
}

/* 
   Remote URI for the Github repository, i.e. https://github.com/ORG/REPO.git
 */
variable "remote_uri" {
  description = "Remote URI for the Github repository, i.e. https://github.com/ORG/REPO.git"
  type        = string
}

variable "build_triggers" {
  nullable    = true
  default     = null
  description = "Cloudbuild trigger definition"
  type = map(object({
    disabled               = optional(bool)
    filename               = string
    name                   = optional(string)
    substitutions          = optional(map(string))
    trigger_match_pattern  = string
    type                   = optional(string, "branch")
  }))
}
