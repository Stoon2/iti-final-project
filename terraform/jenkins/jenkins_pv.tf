resource "kubernetes_persistent_volume" "jenkins_pv" {
  metadata {
    name = "jenkins-pv"
  }
  spec {
    capacity = {
      storage = "20Gi"
    }
    access_modes = ["ReadWriteOnce"]
    storage_class_name = "jenkins-pv"
    persistent_volume_source {
      host_path {
        path = "/data/jenkins-volume/"
      }
    }
  }
}