resource "google_storage_bucket" "tf_state" {
  name = var.state_bucket_name
  location = var.region
  project = var.project_id

  versioning {
    enabled = true
  }

  uniform_bucket_level_access = true

  public_access_prevention = "enforced"

  force_destroy = false
}

resource "google_service_account" "atlantis" {
  account_id = "atlantis-sa"
  display_name = "Atlantis GitOps Service Account"
  project = var.project_id
}

resource "google_storage_bucket_iam_member" "atlantis_state" {
  bucket = google_storage_bucket.tf_state.name
  role = "roles/storage.objectAdmin"
  member = "serviceAccount:${google_service_account.atlantis.email}"
}
