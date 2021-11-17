variable "helm_namespace" {}

variable "helm_release_name" {
  default = "minio"
}

variable "helm_chart" {
  default = "minio"
}

variable "helm_repository" {
  default = "https://charts.bitnami.com/bitnami"
}

variable "helm_repository_password" {
  default = ""
}

variable "helm_repository_username" {
  default = ""
}

variable "chart_version" {
  default = "9.2.0"
}

variable "values" {
  default = ""
  type    = string
}
