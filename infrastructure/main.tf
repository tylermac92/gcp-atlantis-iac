provider "google" {
  project = "ardent-quarter-499716-k0"   # literal is fine here; small demo config
  region  = "us-central1"
}

resource "google_storage_bucket_object" "gitops_demo" {
  name    = "gitops-demo.txt"                  # the object's key in the bucket
  bucket  = "tylermac-iac-tfstate-bootstrap"   # lives in our bucket
  content = "Managed by Atlantis via GitOps.\n" # inline file contents
}
