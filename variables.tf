variable "metadata" {
  type = object({
    annotations   = optional(map(string))
    generate_name = optional(string)
    labels        = optional(map(string))
    name          = string
  })
  default = {
    name = "readerclusterrole"
  }
}

variable "rule" {
  type = list(object({
    api_groups        = optional(list(string))
    non_resource_urls = optional(list(string))
    resource_names    = optional(list(string))
    resources         = optional(list(string))
    verbs             = optional(list(string))
  }))
  default = [{
    api_groups = ["", "rbac.authorization.k8s.io", "storage.k8s.io", "networking.k8s.io", "crd.projectcalico.org", "metrics.k8s.io", "apiextensions.k8s.io"]
    resources  = ["customresourcedefinitions", "clusterroles", "clusterrolebindings", "csidrivers", "csinodes", "nodes", "ingressclasses", "globalnetworkpolicies", "globalnetworksets", "hostendpoints", "namespaces", "storageclasses", "volumeattachments", "pods"]
    verbs      = ["get", "list", "watch"]
  }]
}

variable "aggregation_rule" {
  type = object({
    cluster_role_selectors = object({
      match_labels = optional(map(string))
      match_expressions = optional(object({
        key      = string
        operator = string
        values   = list(string)
      }))
    })
  })
  default = null
}