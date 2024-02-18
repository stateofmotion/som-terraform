variable "cpu" {
  default     = "2"
  description = "Number of CPUs to use"
  type        = string
}

/* 
   Image to use in the Cloud Run service
 */
variable "image" {
  default     = "us-docker.pkg.dev/cloudrun/container/hello"
  description = "Image to use with the Cloud Run service"
  type        = string
}

/* 
   Ingress setting for Cloud Run service
 */
variable "ingress" {
  default     = "INGRESS_TRAFFIC_ALL"
  description = "Values can be one of INGRESS_TRAFFIC_ALL, INGRESS_TRAFFIC_INTERNAL_ONLY, INGRESS_TRAFFIC_INTERNAL_LOAD_BALANCER"
  type        = string
}

/* 
   Memory allocated for the container
   1024Mi, 2Gi etc.
 */
variable "memory" {
  type = string
  default = "2Gi"
}

/* 
   Name of the Cloud Run service
 */
variable "name" {
  default = "cloudrun-service"
  description = "Name of the cloud run service. Must be formatted like my-cool-service"
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
   Region to create the Cloud RUn service in
 */
variable "region" {
  description = "Region to create the Cloud Run service in"
  type        = string
}

/* 
   VPC Connector connection ID
 */
variable "vpc_connection_id" {
  default = null
  description = "VPC connector's connection ID"
  nullable = true
  type = string
}