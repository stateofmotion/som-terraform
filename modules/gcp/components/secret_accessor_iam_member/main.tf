resource "google_secret_manager_secret_iam_member" "member" {
  project   = var.project_id
  role      = "roles/secretmanager.secretAccessor"
  secret_id = var.secret_id
  member    = var.member
}