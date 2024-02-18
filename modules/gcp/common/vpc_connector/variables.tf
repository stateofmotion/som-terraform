/* 
    Region of to create the VPC in. Required since this depends on
    where the resources are deployed.
 */
variable "region" {
  description = "Region to create the VPC connector in"
  type        = string
}

/* 
    Machine type of the vpc connector to use. The default as provided
    by GCP is the "e2-standard-4" instance. Here we override it to use
    the e2-micro instance which is NOT recommended for production
 */
variable "machine_type" {
  default     = "e2-micro"
  description = "Machine type to use for the VPC connector"
  type        = string
}

/* 
   Max instances to use for the VPC connector
 */
variable "max_instances" {
  default     = 2
  description = "Max instances to use for the VPC connector"
  type        = number
}

/* 
   Min instances to use for the VPC connector
 */
variable "min_instances" {
  default     = 1
  description = "Minimum instances to use for the VPC connector."
  type        = number
}

/* 
   Name of the VPC connector. Defaults to "vpc-connector" if 
   a name is omitted.
 */
variable "name" {
  default     = "vpc-connector"
  description = "Name of the vpc connector"
  type        = string
}

/* 
   Name of the VPC network
 */
variable "network_name" {
  description = "Name of the VPC network"
  type        = string
}

/* 
   Project ID to create the VPC connector in
 */
variable "project_id" {
  description = "Project ID"
  type        = string
}

/* 
   Name of the VPC subnet to create the connector for
 */
variable "subnet_name" {
  description = "Name of the VPC subnetwork"
  type        = string
}
