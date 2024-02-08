terraform {
  required_version = ">= 1.7.3"
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.25.2"
    }
  }
}