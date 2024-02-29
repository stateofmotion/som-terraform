/* 
   App Installation ID. This will be a an 8 digit number
 */
variable "app_installation_id" {
  description = "App installation ID. This will be an 8 digit number"
  type        = number
}

/* 
   Github connection secret name
 */
variable "github_secret_name" {
  default     = "github-access-token"
  description = "Name to use for Github secret"
  type        = string
}

/* 
   Github PAT value to use for authenticating with Github
 */
variable "github_token" {
  default     = "github-access-token"
  description = "Github PAT token for authentication"
  type        = string
}

/* 
   Github connection name
 */
variable "name" {
  default     = "github-connection"
  description = "Github connection name"
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
   Region to create the Cloud RUn service in
 */
variable "region" {
  description = "Region to create the Cloud Run service in"
  type        = string
}

variable "repositories" {
  nullable = true
  type = map(object({
    remote_uri     = string
    build_triggers = optional(map(object({
      type            = string
      name            = string
      description     = string
      build_file_path = string
      trigger_match   = string
      disabled        = bool
      substitutions   = map(string)
    })))
  }))
}