resource "kubernetes_config_map" "deployment_env_configmap" {
  metadata {
    name      = "${var.deployment_name}-environment"
    namespace = kubernetes_namespace.namespace.metadata[0].name
    labels = merge({
      # Resource specific lables go here
    }, local.labels)
  }
  data = {
    LOG_LEVEL                    = "info"
    LOG_MESSAGE_KEY              = "msg"
    METRICS_PORT                 = "3001"
    POLLER_INTERVAL_MILLISECONDS = "10000"
    WATCH_TIMEOUT                = "60000"
    VAULT_ADDR                   = var.vault_address
  }
}