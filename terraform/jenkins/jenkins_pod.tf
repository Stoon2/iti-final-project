resource "kubernetes_pod" "jenkins" {
  metadata {
    name = "jenkins"
    namespace = var.namespace
    labels = {
      "app" = "jenkins"
    }
  }

  spec {
    container {
      image = "jenkins/jenkins:lts"
      name  = "jenkins"

      volume_mount {
        mount_path = "/var/jenkins_home/"
        name = "jenkins-data"
      }

      port {
        container_port = 8080
      }
    }

    volume {
      name = "jenkins-data"
      persistent_volume_claim {
        claim_name = kubernetes_persistent_volume_claim.jenkins_pvc.metadata.0.name
      }
    }
}
}