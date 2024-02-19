/* 
   App Installation ID
 */
variable "app_installation_id" {
  description = "App installation ID"
  type        = number
}

/* 
   Github connection secret name
 */
variable "github_secret_name" {
  description = "Name to use for Github secret"
  type        = string
}

/* 
   Github PAT value to use for authenticating with Github
 */
variable "github_token" {
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
   Oauth token secret version
 */
variable "oauth_token_secret_version" {
  description = "Secret version to use for the oauth token"
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