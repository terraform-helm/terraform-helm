variable "helm_config" {
  description = "Helm chart config. Repository and version required. See https://registry.terraform.io/providers/hashicorp/helm/latest/docs"
  type = object(
    {
      name                       = string
      repository                 = optional(string)
      chart                      = string
      version                    = optional(string)
      timeout                    = optional(string, 1200)
      values                     = optional(list)
      create_namespace           = optional(bool, false)
      namespace                  = string
      lint                       = optional(bool, false)
      description                = optional(string, "")
      repository_key_file        = optional(string, "")
      repository_cert_file       = optional(string, "")
      repository_username        = optional(string, "")
      repository_password        = optional(string, "")
      verify                     = optional(bool, false)
      keyring                    = optional(string, "")
      disable_webhooks           = optional(bool, false)
      reuse_values               = optional(bool, false)
      reset_values               = optional(bool, false)
      force_update               = optional(bool, false)
      recreate_pods              = optional(bool, false)
      cleanup_on_fail            = optional(bool, false)
      max_history                = optional(number, 0)
      atomic                     = optional(bool, false)
      skip_crds                  = optional(bool, false)
      render_subchart_notes      = optional(bool, true)
      disable_openapi_validation = optional(bool, false)
      wait                       = optional(bool, true)
      wait_for_jobs              = optional(bool, false)
      dependency_update          = optional(bool, false)
      replace                    = optional(bool, false)
      postrender                 = optional(string, "")
      set                        = optional(list)
      set_sensitive              = optional(list)
    }
  )
}

variable "set_values" {
  description = "Forced set values"
  type        = any
  default     = []
}

variable "set_sensitive_values" {
  description = "Forced set_sensitive values"
  type        = any
  default     = []
}
