resource "helm_release" "this" {
  name                       = var.helm_config.name
  repository                 = var.helm_config.repository
  chart                      = var.helm_config.chart
  version                    = var.helm_config.version
  timeout                    = var.helm_config.timeout
  values                     = var.helm_config.values
  create_namespace           = var.helm_config.create_namespace
  namespace                  = var.helm_config.namespace
  lint                       = var.helm_config.lint
  description                = var.helm_config.description
  repository_key_file        = var.helm_config.repository_key_file
  repository_cert_file       = var.helm_config.repository_cert_file
  repository_username        = var.helm_config.repository_username
  repository_password        = var.helm_config.repository_password
  verify                     = var.helm_config.verify
  keyring                    = var.helm_config.keyring
  disable_webhooks           = var.helm_config.disable_webhooks
  reuse_values               = var.helm_config.reuse_values
  reset_values               = var.helm_config.reset_values
  force_update               = var.helm_config.force_update
  recreate_pods              = var.helm_config.recreate_pods
  cleanup_on_fail            = var.helm_config.cleanup_on_fail
  max_history                = var.helm_config.max_history
  atomic                     = var.helm_config.atomic
  skip_crds                  = var.helm_config.skip_crds
  render_subchart_notes      = var.helm_config.render_subchart_notes
  disable_openapi_validation = var.helm_config.disable_openapi_validation
  wait                       = var.helm_config.wait
  wait_for_jobs              = var.helm_config.wait_for_jobs
  dependency_update          = var.helm_config.dependency_update
  replace                    = var.helm_config.replace

  dynamic "postrender" {
    iterator = each_item
    for_each = var.helm_config.postrender != "" ? [var.helm_config.postrender] : []
    content {
      binary_path = var.helm_config.postrender
    }
  }

  dynamic "set" {
    iterator = each_item
    for_each = var.helm_config.set != null ? distinct(concat(var.set_values, var.helm_config.set)) : var.set_values

    content {
      name  = each_item.value.name
      value = each_item.value.value
      type  = try(each_item.value.type, null)
    }
  }

  dynamic "set_sensitive" {
    iterator = each_item
    for_each = var.helm_config.set_sensitive != null ? concat(var.helm_config.set_sensitive, var.set_sensitive_values) : var.set_sensitive_values

    content {
      name  = each_item.value.name
      value = each_item.value.value
      type  = try(each_item.value.type, null)
    }
  }

  depends_on = [
    kubernetes_namespace.this
  ]
}

resource "kubernetes_namespace" "this" {
  count = var.create_namespace ? 1 : 0
  metadata {
    name = var.helm_config.namespace
  }
}
