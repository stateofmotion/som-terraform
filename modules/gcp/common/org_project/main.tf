/*
  Create a new GCP project within an organization given the
  organization ID
*/
resource "google_project" "org_project" {
  name       = var.name
  project_id = var.project_id
  org_id     = var.org_id
}