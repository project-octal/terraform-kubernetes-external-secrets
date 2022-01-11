locals {
  labels = merge({
    "app.kubernetes.io/name"       = "kubernetes-external-secrets"
    "app.kubernetes.io/instance"   = "var.deployment_name"
    "app.kubernetes.io/managed-by" = "Terraform"
  }, var.labels)
}