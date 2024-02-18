/* 
    Project ID to create the network in.
 */
variable "project_id" {
  type = string
  description = "Project ID to associate with the network"
}

/* 
    Name of the vpc network If name is omitted, the name of
    the network defaults to 'network-1'.
 */
variable "name" {
  default     = "network-1"
  description = "Name of the network. Defaults to network-1"
  type        = string
}

