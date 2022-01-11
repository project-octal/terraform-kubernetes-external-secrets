resource "kubernetes_namespace" "namespace" {
  metadata {
    name = var.namespace
    labels = merge({
      # Resource specific lables go here
    }, local.labels)
  }
}