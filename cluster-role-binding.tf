resource "kubernetes_cluster_role_binding" "cluster_role_binding" {
  metadata {
    name = var.deployment_name
    labels = merge({
      # Resource specific lables go here
    }, local.labels)
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = kubernetes_cluster_role.cluster_role.metadata[0].name
  }
  subject {
    kind      = "ServiceAccount"
    name      = kubernetes_service_account.service_account.metadata[0].name
    namespace = kubernetes_service_account.service_account.metadata[0].namespace
  }
}


resource "kubernetes_cluster_role_binding" "cluster_role_binding_secrets_auth" {
  metadata {
    name = "${var.deployment_name}-secrets-auth"
    labels = merge({
      # Resource specific lables go here
    }, local.labels)
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "system:auth-delegator"
  }
  subject {
    kind      = "ServiceAccount"
    name      = kubernetes_service_account.service_account.metadata[0].name
    namespace = kubernetes_service_account.service_account.metadata[0].namespace
  }
}