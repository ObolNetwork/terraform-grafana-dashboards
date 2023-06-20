# Grafana Dashboards

A set of Obol Grafana dashboards for Node Operators and anyone running charon clients

`make` updates the `README.md` file based on Terraform changes.


## Usage

```terraform
module "grafana_dashboards" {
  source               = "git@github.com:ObolNetwork/terraform-modules.git//grafana-dashboards?ref=vX.x.x"
  folder_name          = "Dashboard Folder Name"
  loki_datasource      = "Loki Datasource URL"
  prometheus_datasource  = "Prometheus Datasource URL"
  notification_channel = "hf934hfow" 
}
```


## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_grafana"></a> [grafana](#requirement\_grafana) | ~> 1.20 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_grafana"></a> [grafana](#provider\_grafana) | ~> 1.20 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [grafana_dashboard.dashboard](https://registry.terraform.io/providers/grafana/grafana/latest/docs/resources/dashboard) | resource |
| [grafana_folder.env_folder](https://registry.terraform.io/providers/grafana/grafana/latest/docs/resources/folder) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dashboards"></a> [dashboards](#input\_dashboards) | Install these dashboards | `list(any)` | <pre>[<br>  "charon_overview",<br>  "alpha_cluster"<br>]</pre> | no |
| <a name="input_folder_name"></a> [folder\_name](#input\_folder\_name) | Grafana Folder Name | `string` | n/a | yes |
| <a name="input_loki_datasource"></a> [loki\_datasource](#input\_loki\_datasource) | Loki Datasource | `string` | n/a | yes |
| <a name="input_overwrite_dashboard"></a> [overwrite\_dashboard](#input\_overwrite\_dashboard) | Always overwrite from Terraform | `bool` | `true` | no |
| <a name="input_prometheus_datasource"></a> [prometheus\_datasource](#input\_prometheus\_datasource) | Prometheus Datasource | `string` | n/a | yes |

## Outputs

No outputs.
