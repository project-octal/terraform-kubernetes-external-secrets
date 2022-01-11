resource "kubernetes_service" "prometheus_service" {
  metadata {
    name      = "${var.deployment_name}-prometheus"
    namespace = kubernetes_namespace.namespace.metadata[0].name
    labels = merge({
      # Resource specific lables go here
    }, local.labels)
  }
  spec {
    selector = local.labels
    port {
      name        = "prometheus"
      protocol    = "TCP"
      target_port = "prometheus"
      port        = 3001
    }
  }
}