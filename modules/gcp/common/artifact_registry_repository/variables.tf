/* 
   Description of the artifact registry repository
 */
variable "description" {
  default     = null
  nullable    = true
  description = "Artifact registry repository description"
  type        = string
}

/* 
   Format of the repository, i.e. DOCKER
 */
variable "format" {
  default     = "DOCKER"
  description = "Format of the artifact repository, i.e. DOCKER"
  type        = string
}

/* 
   Project ID
 */
variable "project_id" {
  description = "Project ID"
  type = string
}

/* 
   Region of the artifact registry
 */
variable "region" {
  description = "Region of the artifact registry"
  type = string
}

/* 
   Name of the artifact registry repository
 */
variable "repository_id" {
  description = "Name of the artifact registry repository, i.e my-repository"
  type = string
}