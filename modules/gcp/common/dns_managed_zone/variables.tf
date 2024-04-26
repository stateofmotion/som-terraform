/* 
 * Name of the DNS Zone
 */
variable "name" {
  default     = "default-dns-zone"
  type        = string
  description = "Name of the DNS Zone"
}

/* 
 * DNS Name. This is the root of the domain you want to use
 * This includes the trailing '.'
 */
variable "dns_name" {
  type        = string
  description = "DNS Name. This is the root of the domain you want to use and includes the trailing '.'"
}

/* 
 * Project ID to apply IAM permissions to.
 */
variable "project_id" {
  type        = string
  description = "The project ID to assign IAM permissions to"
}

/* 
 * DNS Zone description
 */
variable "description" {
  default     = "DNS Zone"
  type        = string
  description = "Description of the DNS Zone"
}