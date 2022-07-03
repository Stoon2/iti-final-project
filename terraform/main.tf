module "jenkins" {
  source = "./jenkins"
  namespace = kubernetes_namespace.tools.metadata.0.name
}

module "nexus" {
    source = "./nexus"
    namespace = kubernetes_namespace.tools.metadata.0.name
}

