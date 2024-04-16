
variable "project" {
  type        = string
  description = "ID of the GCP project"
}

variable "region" {
  type        = string
  description = "Region of the workflow, i.e. us-central1"
}

variable "service_account_id" {
  type        = string
  description = "Service account to use for the workflow"
}

variable "call_log_level" {
  type        = string
  default     = "LOG_ALL_CALLS"
  description = "One of LOG_ERRORS_ONLY, CALL_LOG_LEVEL_UNSPECIFIED, LOG_ALL_CALLS, LOG_ERRORS_ONLY, LOG_NONE"
}

variable "file_path" {
  type        = string
  description = "The file path (relative to the terraform folder)"
}
