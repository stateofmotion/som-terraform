/* 
 * Project role belongs to
 */
variable "project_id" {
  type        = string
  description = "Project role belongs to"
}

/* 
 * Role ID
 */
variable "role_id" {
  type        = string
  description = "Role identifier, i.e someCoolRole"
}

/* 
 * Permissions to add to the role
 */
variable "permissions" {
  default     = []
  type        = list(string)
  description = "Permissions to add to the role"
}