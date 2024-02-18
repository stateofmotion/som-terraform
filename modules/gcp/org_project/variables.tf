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
    resource ID within Google Cloud
 */
variable "project_id" {
    type = string
    description = "The project ID that must be globally unique"
}

