variable "clusterrolename" {
  type    = string
  default = null
}

variable "rules" {
  type = any
  default = {
    rule1 = {
      api_groups = ["", "rbac.authorization.k8s.io", "storage.k8s.io", "networking.k8s.io", "crd.projectcalico.org", "metrics.k8s.io","apiextensions.k8s.io"]
      resources  = ["customresourcedefinitions","clusterroles", "clusterrolebindings", "csidrivers", "csinodes", "nodes", "ingressclasses", "globalnetworkpolicies", "globalnetworksets", "hostendpoints", "namespaces", "storageclasses", "volumeattachments", "pods"]
      verbs      = ["get", "list", "watch"]
    }
  }
}