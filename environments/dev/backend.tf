terraform {
  backend "gcs" {
    bucket = "gke-terraform-state-dev"
    prefix = "terraform/state"
  }
}