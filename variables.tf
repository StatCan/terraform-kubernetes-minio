variable "helm_namespace" {}

variable "helm_release_name" {
  default = "minio"
}

variable "helm_chart" {
  default = "minio"
}

variable "helm_repository" {
  type        = string
  default     = "https://charts.bitnami.com/bitnami"
  description = "The repository where the Helm chart is stored"
}

variable "helm_repository_password" {
  type        = string
  nullable    = false
  default     = ""
  description = "The password of the repository where the Helm chart is stored"
  sensitive   = true
}

variable "helm_repository_username" {
  type        = string
  nullable    = false
  default     = ""
  description = "The username of the repository where the Helm chart is stored"
  sensitive   = true
}

variable "chart_version" {
  default = "9.2.0"
}

variable "values" {
  default = ""
  type    = string
}
