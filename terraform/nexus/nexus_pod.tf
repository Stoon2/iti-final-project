resource "kubernetes_pod" "nexus" {
  metadata {
    name = "nexus"
    namespace = var.namespace
    labels = {
      "app" = "nexus"
    }
  }

  spec {
    container {
      image = "sonatype/nexus3"
      name  = "nexus"

      volume_mount {
        mount_path = "/sonatype-work"
        name = "nexus-data"
      }


      port {
        container_port = 8081
      }
    }

    volume {
      name = "nexus-data"
      persistent_volume_claim {
        claim_name = kubernetes_persistent_volume_claim.nexus_pvc.metadata.0.name
      }
    }
}
}