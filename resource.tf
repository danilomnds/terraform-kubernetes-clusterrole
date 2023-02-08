resource "kubernetes_cluster_role" "clusterrole" {
  metadata {
    name = var.clusterrolename == null ? "clusterrole-custom-tim" : var.clusterrolename
  }
  dynamic "rule" {
    for_each = var.rules
    content {
      api_groups     = rule.value.api_groups
      resources      = rule.value.resources
      resource_names = try(rule.value.resource_names, null)
      verbs          = rule.value.verbs
    }
  }
}