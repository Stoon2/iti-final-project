resource "kubernetes_persistent_volume_claim" "nexus_pvc" {
  metadata {
    name = "nexus-pvc"
    namespace = var.namespace
  }
  spec {
    access_modes = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = "5Gi"
      }
    }
    storage_class_name = kubernetes_persistent_volume.nexus_pv.spec.0.storage_class_name
  }
}