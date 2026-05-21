variable "project_id" {
  description = "ID del proyecto GCP"
  type        = string
}

variable "region" {
  description = "Región de GCP para el clúster"
  type        = string
  default     = "us-central1"
}

variable "cluster_name" {
  description = "Nombre base para el clúster GKE"
  type        = string
  default     = "gke"
}



variable "environment" {
  description = "Nombre base para el env GKE"
  type        = string
  default     = "dev"
}

variable "deploy_rag_stack" {
  description = "Despliega recursos adicionales de GPU si el Stack RAG está habilitado"
  type        = string
  default     = "false"
}

variable "primary_node_count" {
  description = "Número de nodos para el node pool principal"
  type        = number
  default     = 2
}

variable "primary_machine_type" {
  description = "Tipo de máquina para el node pool principal"
  type        = string
  default     = "n1-standard-2"
}

variable "primary_disk_size_gb" {
  description = "Tamaño del disco (GB) para el node pool principal"
  type        = number
  default     = 10
}

locals {
  deploy_rag_stack_bool = var.deploy_rag_stack == "true"
}
