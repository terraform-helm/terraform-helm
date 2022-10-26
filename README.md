<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >= 2.7.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | >= 2.7.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.this](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_helm_config"></a> [helm\_config](#input\_helm\_config) | Helm chart config. Repository and version required. See https://registry.terraform.io/providers/hashicorp/helm/latest/docs | <pre>object(<br>    {<br>      name                       = string<br>      repository                 = optional(string)<br>      chart                      = string<br>      version                    = optional(string)<br>      timeout                    = optional(string, 300)<br>      values                     = optional(list(string))<br>      create_namespace           = optional(bool, false)<br>      namespace                  = string<br>      lint                       = optional(bool, false)<br>      description                = optional(string, "")<br>      repository_key_file        = optional(string, "")<br>      repository_cert_file       = optional(string, "")<br>      repository_username        = optional(string, "")<br>      repository_password        = optional(string, "")<br>      verify                     = optional(bool, false)<br>      keyring                    = optional(string, "")<br>      disable_webhooks           = optional(bool, false)<br>      reuse_values               = optional(bool, false)<br>      reset_values               = optional(bool, false)<br>      force_update               = optional(bool, false)<br>      recreate_pods              = optional(bool, false)<br>      cleanup_on_fail            = optional(bool, false)<br>      max_history                = optional(number, 0)<br>      atomic                     = optional(bool, false)<br>      skip_crds                  = optional(bool, false)<br>      render_subchart_notes      = optional(bool, true)<br>      disable_openapi_validation = optional(bool, false)<br>      wait                       = optional(bool, true)<br>      wait_for_jobs              = optional(bool, false)<br>      dependency_update          = optional(bool, false)<br>      replace                    = optional(bool, false)<br>      postrender                 = optional(string, "")<br>      set                        = optional(list(string))<br>      set_sensitive              = optional(list(string))<br>    }<br>  )</pre> | n/a | yes |
| <a name="input_set_sensitive_values"></a> [set\_sensitive\_values](#input\_set\_sensitive\_values) | Forced set\_sensitive values | `any` | `[]` | no |
| <a name="input_set_values"></a> [set\_values](#input\_set\_values) | Forced set values | `any` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_helm_release"></a> [helm\_release](#output\_helm\_release) | Map of attributes of the Helm release created without sensitive outputs |
<!-- END_TF_DOCS -->