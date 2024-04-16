locals {
  workflow_name = trimsuffix(basename(data.local_file.file.filename), ".json")
}

data "local_file" "file" {
  filename = var.file_path
}

// https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/workflows_workflow
// https://cloud.google.com/workflows/docs/reference/rest/v1/projects.locations.workflows/create
resource "google_workflows_workflow" "workflow" {
  call_log_level  = var.call_log_level
  name            = local.workflow_name
  project         = var.project
  region          = var.region
  service_account = var.service_account_id
  source_contents = data.local_file.file.content
}

output "id" {
  value = google_workflows_workflow.workflow.id
}

output "name" {
  value = google_workflows_workflow.workflow.name
}

output "revision_id" {
  value = google_workflows_workflow.workflow.revision_id
}