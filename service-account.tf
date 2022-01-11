resource "kubernetes_service_account" "service_account" {
  metadata {
    name      = var.deployment_name
    namespace = kubernetes_namespace.namespace.metadata[0].name
    labels = merge({
      # Resource specific lables go here
    }, local.labels)
  }
}    