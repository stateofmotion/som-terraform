/* 
   Member to grant accessor permissions for. 
 */
variable "member" {
  description = "Member to grant accessor permissions for. Service account, user, group etc."
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
   Secret ID to grant access for
 */
variable "secret_id" {
  description = "Secret ID to grant meber accessor permissions for"
  type = string
}