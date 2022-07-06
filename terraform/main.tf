module "jenkins" {
  source = "./jenkins"
  namespace = kubernetes_namespace.tools.metadata.0.name
}

module "nexus" {
    source = "./nexus"
    namespace = kubernetes_namespace.tools.metadata.0.name
}

module "security" {
  source = "./security"
  namespace = kubernetes_namespace.dev.metadata.0.name
  registry_username = var.registry_username
  registry_password = var.registry_password
  registry_server = "${module.nexus.repo-ip}:9001"

}

