# GCP APIs
# このファイルで有効化するGCPサービスAPIを管理します

resource "google_project_service" "aiplatform" {
  project = local.project_id
  service = "aiplatform.googleapis.com"

  disable_on_destroy = false
}

# Vertex AI Users
locals {
  aiplatform_users = [
    "shiron4710@gmail.com",
    "soma.t.8001@gmail.com",
    "koushi.tanaka54@gmail.com",
  ]
}

resource "google_project_iam_member" "aiplatform_user" {
  for_each = toset(local.aiplatform_users)

  project = local.project_id
  role    = "roles/aiplatform.user"
  member  = "user:${each.value}"
}

