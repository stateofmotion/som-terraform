/* 
   Dictates whether the build trigger is enabled or disabled
 */
variable "disabled" {
  default     = false
  description = "Dictates whether the build trigger is enabled or disabled"
  type        = bool
}

/* 
   Cloudbuild filename
 */
variable "filename" {
  description = "Cloudbuild filename"
  type = string
}


/* 
   Name of the build trigger
 */
variable "name" {
  description = "Name of the build trigger."
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
   Region to create the build trigger in
 */
variable "region" {
  description = "Region to create the build trigger in"
  type        = string
}

/* 
   Cloudbuild repository
 */
variable "repository_id" {
  description = "Cloudbuild repository ID"
  type        = string
}

/* 
   Cloudbuild substitutions
 */
variable "substitutions" {
  default     = {}
  description = "Cloudbuild substitutions"
  type        = map(string)  
}

/* 
   Trigger match pattern
 */
variable "trigger_match_pattern" {
  description = "Build trigger match pattern"
  type        = string
}

/* 
   Trigger type of 'tag' or 'branch'
 */
variable "trigger_type" {
  default     = "branch"
  type        = string
  description = "Trigger type of 'tag' or 'branch'"
  validation {
    condition     = var.trigger_type == "tag" || var.trigger_type == "branch"
    error_message = "The trigger_type must be either 'tag' or 'branch'."
  }
}