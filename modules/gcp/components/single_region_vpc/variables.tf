/* 
    Subnet CIDR range to use. If none is provided the CIDR
 */
variable "ip_cidr_range" {
  default     = "10.2.0.0/28"
  description = "Subnet IP cider range. Defaults to 10.2.0.0/28"
  type        = string
}

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

/* 
    Name of the vpc network If name is omitted, the name of
    the network defaults to 'network-1'.
 */
variable "subnet_name" {
  default     = "network-1"
  description = "Name of the network. Defaults to network-1"
  type        = string
}

/* 
    Subnet region. If no value is provided, us-central1 will be used.
 */
variable "region" {
  default     = "us-central1"
  description = "Which region to create the subnet in."
  type        = string
}
