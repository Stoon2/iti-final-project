resource "kubernetes_service" "nexus" {
  metadata {
    name = "nexus"
    namespace = var.namespace
  }
  spec {
    selector = {
      app = kubernetes_pod.nexus.metadata.0.labels.app
    }

    port {
      port        = 8081
      target_port = 8081
    }

    type = "NodePort"
  }
}