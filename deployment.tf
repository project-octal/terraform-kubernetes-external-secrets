resource "kubernetes_deployment" "deployment" {
  metadata {
    name      = var.deployment_name
    namespace = kubernetes_namespace.namespace.metadata[0].name
    labels = merge({
      # Resource specific labels go here
    }, local.labels)
  }
  spec {
    replicas = var.replicas
    selector {
      match_labels = local.labels
    }
    template {
      metadata {
        labels = local.labels
      }
      spec {
        service_account_name = kubernetes_service_account.service_account.metadata[0].name
        security_context {
          run_as_non_root = true
        }
        container {
          name              = var.deployment_name
          image             = "${var.image_repository}/${var.image_name}:${var.image_tag}"
          image_pull_policy = var.image_pull_policy
          resources {
            requests = {
              "cpu"    = var.resource_requests.cpu
              "memory" = var.resource_requests.memory
            }
            limits = {
              "cpu"    = var.resource_limits.cpu
              "memory" = var.resource_limits.memory
            }
          }
          env_from {
            config_map_ref {
              name = kubernetes_config_map.deployment_env_configmap.metadata[0].name
            }
          }
          port {
            name           = "prometheus"
            container_port = 3001
          }
        }
      }
    }
  }
}