resource "kubernetes_cluster_role" "clusterrole" {
  dynamic "metadata" {
    for_each = var.metadata != null ? [var.metadata] : []
    content {
      annotations   = lookup(metadata.value, "annotations", null)
      generate_name = lookup(metadata.value, "generate_name", null)
      labels        = lookup(metadata.value, "labels", null)
      name          = lookup(metadata.value, "name", null)
    }
  }
  dynamic "rule" {
    for_each = var.rule
    content {
      api_groups        = lookup(rule.value, "api_groups", null)
      resources         = lookup(rule.value, "resources", null)
      resource_names    = lookup(rule.value, "resource_names", null)
      non_resource_urls = lookup(rule.value, "non_resource_urls", null)
      verbs             = rule.value.verbs
    }
  }
  dynamic "aggregation_rule" {
    for_each = var.aggregation_rule != null ? [var.aggregation_rule] : []
    content {
      dynamic "cluster_role_selectors" {
        for_each = aggregation_rule.value.cluster_role_selectors != null ? [aggregation_rule.value.cluster_role_selectors] : []
        content {
          match_labels = lookup(cluster_role_selectors.value, "match_labels", null)
          dynamic "match_expressions" {
            for_each = cluster_role_selectors.value.match_expressions != null ? [cluster_role_selectors.value.match_expressions] : []
            content {
              key      = match_expressions.value.key
              operator = match_expressions.value.operator
              values   = match_expressions.value.values
            }
          }
        }
      }
    }
  }
}