resource "kubernetes_namespace" "tools" {
  metadata {
    name = "tools"
  }
}

resource "kubernetes_namespace" "dev" {
  metadata {
    name = "dev"
  }
}