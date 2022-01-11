resource "kubernetes_manifest" "io_externalsecrets_crd" {
  field_manager {
    force_conflicts = true
  }
  manifest = yamldecode(templatefile("${path.module}/custom-resource-definitions/kubernetes-client.io_externalsecrets_crd.yaml", {}))
}