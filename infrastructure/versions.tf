terraform {
  required_version = ">= 1.5"

  backend "gcs" {
    bucket = "tylermac-iac-tfstate-bootstrap"  # same bucket (it's just our central state store)
    prefix = "app"                              # SEPARATE state path from "bootstrap"
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 7.0"
    }
  }
}
