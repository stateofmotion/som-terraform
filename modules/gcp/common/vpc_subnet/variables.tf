/* 
    Subnet CIDR range to use. If none is provided the CIDR
 */
variable "ip_cidr_range" {
  default     = "10.2.0.0/28"
  description = "Subnet IP cider range. Defaults to 10.2.0.0/28"
  type        = string
}

/* 
    Name of the subnet. If omitted the name of the subnet defaults
    to subnet-1
 */
variable "name" {
  default     = "subnet-1"
  description = "Name of the subnet. Defaults to subnet-1"
  type        = string
}

/* 
    Network ID to build the subnet in.
 */
variable "network_id" {
  description = "ID of the network to create the subnet in"
  type        = string
}

/* 
    ID of the project to create the subnet in.
 */
variable "project_id" {
  description = "Project to create the subnet in"
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