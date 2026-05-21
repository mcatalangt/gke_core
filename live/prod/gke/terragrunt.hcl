locals {
  gcp_project_id = get_env("GOOGLE_PROJECT_ID", "mi-proyecto-local-fallback")
  gcp_region = get_env("GOOGLE_REGION", "us-central1")
  deploy_stack = get_env("TARGET_ENV", "prod")
}

include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../modules//gke-base"
}

inputs = {
  project_id           = get_env("GOOGLE_PROJECT_ID", "mi-proyecto")
  region               = get_env("GOOGLE_REGION", "us-central1")
  cluster_name         = "${local.deploy_stack}"
  environment          = "${local.deploy_stack}" 
  
  # === CONFIGURACIÓN DE ALTA DISPONIBILIDAD (HA) ===
  primary_node_count   = 4                  # 3 nodos para tolerar fallos
  primary_machine_type = "e2-standard-2"    # Máquinas más potentes
  primary_disk_size_gb = 25                 # Más espacio en disco
}
