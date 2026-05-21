include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../modules//gke-base"
}

inputs = {
  project_id           = get_env("GOOGLE_PROJECT_ID", "mi-proyecto")
  region               = get_env("GOOGLE_REGION", "us-central1")
  cluster_name         = "k8s-base"
  environment          = "stage" 
  
  # === CONFIGURACIÓN DE ALTA DISPONIBILIDAD (HA) ===
  primary_node_count   = 3                  # 3 nodos para tolerar fallos
  primary_machine_type = "e2-standard-4"    # Máquinas más potentes
  primary_disk_size_gb = 50                 # Más espacio en disco
}
