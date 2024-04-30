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
   Map of secrets where the key is the name of the secret, and value is the content
 */
variable "secrets" {
  description = "Map of secrets where the key is the name of the secret, and value is the content"
  type = map(string)
}