/* 
 * Project ID to apply IAM permissions to.
 */
variable "project_id" {
  type        = string
  description = "The project ID to assign IAM permissions to"
}

/* 
 * Name of the zone to add the record in
 */
variable "zone_name" {
  type        = string
  description = "Name of the zone to add the record in"
}

/* 
 * Fully qualified host to set the record for (including trailing decimal)
 */
variable "name" {
  type        = string
  description = "Fully qualified host to set the record for (including trailing decimal)"
}

/* 
 * Record type. A, TXT etc.
 */
variable "type" {
  type        = string
  description = "Record type. A, TXT etc."
}

/* 
 * Record TTL
 */
variable "ttl" {
  default     = 300
  type        = number
  description = "Record TTL. Defaults to 300"
}

/* 
 * String data for the records. The values so to speak.
 */
variable "rrdatas" {
  default     = []
  type        = list(string)
  description = "String data for the records. The values so to speak."
}