resource "google_storage_bucket" "odc_state" {
  name = "odc-state-bucket"
  location = local.region
  uniform_bucket_level_access = true
  
  versioning {
    enabled = true
  }
  lifecycle {
    prevent_destroy = true
  }
}

resource "google_storage_bucket_iam_binding" "odc_state_binding" {
  bucket = google_storage_bucket.odc_state.name
  role = "roles/storage.admin"
  members = [
    "serviceAccount:${local.terraform_service_account_email}"
  ]
}
