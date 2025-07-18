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

resource "grafana_folder" "folder" {
  title = var.folder_name
}


resource "grafana_dashboard" "dashboard" {
  folder    = grafana_folder.folder.id
  for_each  = local.dashboard_set
  overwrite = var.overwrite_dashboard

  config_json = templatefile(
    "${path.module}/dashboards/${each.key}.json",
    {
      LOKI_DATASOURCE       = var.loki_datasource,
      PROMETHEUS_DATASOURCE = var.prometheus_datasource,
    }
  )
}