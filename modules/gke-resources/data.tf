data "terraform_remote_state" "gke_state" {
  backend = "gcs"
  config = {
    bucket = "backend-terraform-core-drh"
    prefix = "gke-cluster"
  }
}


data "google_client_config" "default" {}
