resource "kubernetes_service" "jenkins" {
  metadata {
    name = "jenkins"
    namespace = var.namespace
  }
  spec {
    selector = {
      app = kubernetes_pod.jenkins.metadata.0.labels.app
    }

    port {
      port        = 8080
      target_port = 8080
    }

    type = "NodePort"
  }
}