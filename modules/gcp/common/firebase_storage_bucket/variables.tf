/* 
  Globally unique project ID that will be used as the
  resource ID within Google Cloud. my-new-project for example
 */
variable "project_id" {
  description = "The project ID that must be globally unique"
  type = string
}

/* 
  Bucket ID. This will come from the app engine default when
  using firebase
 */
variable "bucket_id" {
  description = "The bucket ID. This will come from the app engine default."
  type = string
}