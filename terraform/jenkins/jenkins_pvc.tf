resource "kubernetes_persistent_volume_claim" "jenkins_pvc" {
  metadata {
    name = "jenkins-pvc"
    namespace = var.namespace
  }
  spec {
    access_modes = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = "20Gi"
      }
    }
    storage_class_name = kubernetes_persistent_volume.jenkins_pv.spec.0.storage_class_name
  }
}