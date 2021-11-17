terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0.3"
    }
  }
  required_version = "~> 1.0.9"
}

 provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_namespace" "minio_system" {
  metadata {
    name = "minio-system"
  }
}

module "minio-service-account" {
  source = "../../"

  depends_on = [resource.kubernetes_namespace.minio_system]
  helm_namespace = "minio-system"

  values = <<EOF
auth:
  rootUser: admin
  rootPassword: "12345678"

serviceAccount:
  create: true
  name: "minio"
EOF
}
