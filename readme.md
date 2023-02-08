# Module - Cluster role k8s
[![COE](https://img.shields.io/badge/Created%20By-CCoE-blue)]()
[![HCL](https://img.shields.io/badge/language-HCL-blueviolet)](https://www.terraform.io/)
[![Azure](https://img.shields.io/badge/provider-Azure-blue)](https://registry.terraform.io/providers/hashicorp/azurerm/latest)

Module developed to standardize the creation of cluster roles in K8S environments.

## Compatibility matrix

| Module Version | Terraform Version | Kubernetes Provider Version |
|----------------|-------------------| --------------------------- |
| v1.0.0         | v1.3.6            | 2.17.0                      |

## Specifying a version

To avoid that your code get automatically updates for the module is mandatory to set the version using the `source` option. 
By defining the `?ref=***` in the the URL, you can use a specific version of the module.

Note: The `?ref=***` refers a tag on the git module repo.

## Use case for the creation of a standard clusterrole

```hcl
module "<clustername>-clusterrole" {  
  source = "git::https://github.com/danilomnds/terraform-kubernetes-clusterrole?ref=v1.0.0"  
}
```

## Use case for the creation of a customized clusterrole

```hcl
module "<clustername>-clusterrole" {  
  source = "git::https://github.com/danilomnds/terraform-kubernetes-clusterrole?ref=v1.0.0"  
  clusterrolename = <custom cluster role name>
  rules = {
    rule1 = {
      api_groups = ["", "rbac.authorization.k8s.io", "storage.k8s.io", "networking.k8s.io", "crd.projectcalico.org"]
      resources  = ["clusterroles", "clusterrolebindings", "csidrivers", "csinodes", "nodes", "ingressclasses", "globalnetworkpolicies", "globalnetworksets", "hostendpoints", "namespaces", "storageclasses", "volumeattachments"]
      verbs      = ["get", "list", "watch"]
    }
  }
}
```

## Input Variables

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| clusterrolename | cluster role name | `string` | `standard cluster role name` | No |
| rules | customized list of rules to be included in the role | `any` | `default privileges` | No |

## Documentation

Terraform kubernetes_cluster_role: <br>
[https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/cluster_role](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/cluster_role)<br>