# Name of the Helm Namespace
output "helm_namespace" {
  value = module.minio-service-account.helm_namespace
}
