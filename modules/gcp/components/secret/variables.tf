/* 
   Name of the secret to use
 */
variable "name" {
  description = "Name of the secret"
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
   Region of the secret
 */
variable "region" {
  description = "Region of the secret"
  type = string
}

/* 
   Data to store in the secret
 */
variable "secret_data" {
  description = "Data to store in secret"
  type = string
}