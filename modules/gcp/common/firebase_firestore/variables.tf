/* 
   Location ID. nam5 is the default which is US multi-regional
 */
variable "location_id" {
  default     = "nam5"
  description = "Name of the firestore database"
  type        = string
}

/* 
   Name of the Firestore database
 */
variable "name" {
  default     = "(default)"
  description = "Name of the firestore database"
  type        = string
}

/* 
   Project ID
 */
variable "project_id" {
  description = "Project ID"
  type        = string
}

/* 
   Type of database, i.e. Firestore vs. Datastore
   ! Need validation here for accepted values
 */
variable "type" {
  default     = "FIRESTORE_NATIVE"
  description = "Type of database, i.e. Firestore vs. Datastore"
  type        = string
}
