output "label" {
    value = kubernetes_pod.nexus.metadata.0.labels.app
}

output "repo-ip" {
  value = kubernetes_service.nexus-repo.spec.0.cluster_ip
}