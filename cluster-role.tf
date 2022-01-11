resource "kubernetes_cluster_role" "cluster_role" {
  metadata {
    name = var.deployment_name
    labels = merge({
      # Resource specific lables go here
    }, local.labels)
  }

  rule {
    api_groups = [""]
    resources  = ["secrets"]
    verbs      = ["create", "update", "get"]
  }

  rule {
    api_groups = [""]
    resources  = ["namespaces"]
    verbs      = ["get", "watch", "list"]
  }

  rule {
    api_groups     = [""]
    resource_names = ["externalsecrets.kubernetes-client.io"]
    resources      = ["customresourcedefinitions"]
    verbs          = ["get", "update"]
  }

  rule {
    api_groups = ["kubernetes-client.io"]
    resources  = ["externalsecrets"]
    verbs      = ["get", "watch", "list"]
  }

  rule {
    api_groups = ["kubernetes-client.io"]
    resources  = ["externalsecrets/status"]
    verbs      = ["get", "update"]
  }
}