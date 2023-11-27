# Module - Cluster role k8s
[![COE](https://img.shields.io/badge/Created%20By-CCoE-blue)]()
[![HCL](https://img.shields.io/badge/language-HCL-blueviolet)](https://www.terraform.io/)
[![Azure](https://img.shields.io/badge/provider-Azure-blue)](https://registry.terraform.io/providers/hashicorp/azurerm/latest)

Module developed to standardize the creation of cluster roles in K8S environments.

## Compatibility matrix

| Module Version | Terraform Version | Kubernetes Provider Version |
|----------------|-------------------| --------------------------- |
| v1.0.0         | v1.6.4            | 2.23.0                      |

## Specifying a version

To avoid that your code get the latest module version, you can define the `?ref=***` in the URL to point to a specific version.
Note: The `?ref=***` refers a tag on the git module repo.

## Use case for the creation of a standard clusterrole

```hcl
module "<clustername>-clusterrole" {  
  source = "git::https://github.com/danilomnds/terraform-kubernetes-clusterrole?ref=v2.0.0"  
}
```

## Use case for the creation of a customized clusterrole

```hcl
module "<clustername>-clusterrole" {  
  source = "git::https://github.com/danilomnds/terraform-kubernetes-clusterrole?ref=v2.0.0"  
  metadata = {
    name = <custom clusterrole name>
  }
  rule = [{
      api_groups = ["", "rbac.authorization.k8s.io", "storage.k8s.io", "networking.k8s.io", "crd.projectcalico.org"]
      resources  = ["clusterroles", "clusterrolebindings", "csidrivers", "csinodes", "nodes", "ingressclasses", "globalnetworkpolicies", "globalnetworksets", "hostendpoints", "namespaces", "storageclasses", "volumeattachments"]
      verbs      = ["get", "list", "watch"]
    }]
  }
```

## Input Variables

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| metadata | a block as defined below | `object({})` | n/a | No |
| rules | a block as defined below | `list(object({}))` | n/a | No |
| aggregation_rule | a block as defined below | `object({})` | n/a | No |

# Object variables for blocks

| Variable Name (Block) | Parameter | Description | Type | Default | Required |
|-----------------------|-----------|-------------|------|---------|:--------:|
| metadata | annotations | an unstructured key value map stored with the cluster role binding that may be used to store arbitrary metadata | `map(string)` | `null` | No |
| metadata | generate_name | prefix, used by the server, to generate a unique name only if the name field has not been provided | `string` | `null` | No |
| metadata | labels | map of string keys and values that can be used to organize and categorize (scope and select) the cluster role binding | `map(string)` | `null` | No |
| metadata | name | cluster role name | `string` | `readerclusterrole` | No |
| rules | api_groups | apigroups is the name of the apigroup that contains the resources | `list(string)` | `null` | No |
| rules | non_resource_urls | nonresourceurls is a set of partial urls that a user should have access to. *s are allowed, but only as the full, final step in the path since non-resource urls are not namespaced, this field is only applicable for clusterroles referenced from a clusterrolebinding | `list(string)` | `null` | No |
| rules | resource_names | resourcenames is an optional white list of names that the rule applies to | `list(string)` | `null` | No |
| rules | resources | resources is a list of resources this rule applies to | `list(string)` | `null` | No |
| rules | verbs | verbs is a list of verbs that apply to all the resourcekinds and attributerestrictions contained in this rule | `list(string)` | `null` | No |
| cluster_role_selectors | match_expressions  | resources is a list of resources this rule applies to | `map(string)` | `null` | No |
| cluster_role_selectors | match_labels | verbs is a list of verbs that apply to all the resourcekinds and attributerestrictions contained in this rule | `object({})` | `null` | No |

## Documentation

Terraform kubernetes_cluster_role: <br>
[https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/cluster_role](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/cluster_role)<br>