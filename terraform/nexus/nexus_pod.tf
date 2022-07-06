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
  
      port {
        container_port = 8081
      }
    }

    init_container {
      name = "perms"
      image = "busybox"
      command = [ "sh", "-c", "chown -R 200:200 /nexus-data" ]
      volume_mount {
        name = "nexus-data"
        mount_path = "/nexus-data"
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