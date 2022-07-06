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

resource "kubernetes_service" "nexus-repo" {

  # provisioner "remote-exec" {
  #    inline = [
  #     "",
  #     "cd ..",
  #     "git add repo-ip.txt",
  #     "git commit -m 'repo new ip' ",
  #     "git push origin main"
  #   ]
  
  # }
  provisioner "local-exec" {

    command = <<-EOT
    echo ${self.spec.0.cluster_ip} > ../repo-ip.txt     
    cd ..
    git add repo-ip.txt
    git commit -m 'repo new ip'
    git push origin main
    EOT
  }
  metadata {
    name = "nexus-repo"
    namespace = var.namespace
  }
  spec {
    selector = {
      app = kubernetes_pod.nexus.metadata.0.labels.app
    }

    port {
      port        = 9001
      target_port = 9001
    }

    type = "ClusterIP"
  }
}


