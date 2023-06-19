variable "folder_name" {
  description = "Grafana Folder Name"
  type        = string
}

variable "prometheus_datasource" {
  description = "Prometheus Datasource"
  type        = string
}


variable "loki_datasource" {
  description = "Loki Datasource"
  type        = string
}

variable "dashboards" {
  description = "Install these dashboards"
  type        = list(any)
  default = [
    "charon_cluster",
    "alpha_cluster"
  ]
}

variable "overwrite_dashboard" {
  description = "Always overwrite from Terraform"
  type        = bool
  default     = true
}