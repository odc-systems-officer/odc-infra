terraform {
  # backend "local" {
  #   path = ".terraform/terraform.tfstate"
  # }
  backend "gcs" {
    bucket  = "odc-state-bucket"
    prefix  = "terraform/state"
  }

  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.1.0"
    }
  }
}

provider "google" {
    project = local.project_id
    region = local.region
}

locals {
    project_id = "uwa-outdoor-club-435709"
    region = "us-west1"
    terraform_service_account_email = "389707156404-compute@developer.gserviceaccount.com"
}
