resource "kubernetes_persistent_volume" "nexus_pv" {
  metadata {
    name = "nexus-pv"
  }
  spec {
    capacity = {
      storage = "5Gi"
    }
    access_modes = ["ReadWriteOnce"]
    storage_class_name = "nexus-pv"
    persistent_volume_source {
      host_path {
        path = "/data/nexus-volume/"
      }
    }
  }
}