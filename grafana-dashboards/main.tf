terraform {
  required_providers {
    grafana = {
      source  = "grafana/grafana"
      version = "~> 1.20"
    }
  }
}

locals {
  dashboard_set = toset(var.dashboards)
}

resource "random_string" "random" {
  for_each = local.dashboard_set
  length   = 12
  special  = false
}

resource "grafana_folder" "env_folder" {
  title = var.folder_name
}

locals {
  dashboard_set = toset(var.dashboards)
}

resource "random_string" "random" {
  for_each = local.dashboard_set
  length   = 12
  special  = false
}

resource "grafana_dashboard" "dashboard" {
  folder    = grafana_folder.env_folder.id
  for_each  = local.dashboard_set
  overwrite = var.overwrite_dashboard

  config_json = templatefile(
    "${path.module}/dashboards/${each.key}.json",
    {
      LOKI_DATASOURCE     = var.loki_datasource,
      PROMETHEUS_DATASOURCE     = var.prometheus_datasource,
    }
  )
}