/* 
    Create the default network subnets. If omitted the subnets that typically
    get created when the GCP project is created will not be created. 
 */
variable "auto_create_network" {
  type        = bool
  default     = false
  description = "Default VPC network creation. Creates subnets in all regions. Default value is false"
}

/* 
    Billing account associated with the project. This will be found in "billing"
    section of the console under "Billing account ID"
 */
variable "billing_account" {
  type        = string
  default     = null
  description = "Billing account ID. Found in the 'billing' section under 'Billing account Id'"
}

/* 
    The Google Project Name. User friendly name that appears
    on in Google Cloud console. "My New Project" for example
 */
variable "name" {
    type        = string
    description = "User friendly name of the project. Not the project ID"
}

/* 
    The organization that the project should be created in.
 */
variable "org_id" {
    type = string
    description = "The project ID that must be globally unique"
}

/* 
    Globally unique project ID that will be used as the
    resource ID within Google Cloud. my-new-project for example
 */
variable "project_id" {
    type = string
    description = "The project ID that must be globally unique"
}

