resource "kubernetes_namespace" "argocd" {
  metadata {
    name = "argocd"
  }

  depends_on = [data.aws_eks_cluster.cluster]
}

resource "helm_release" "argocd" {
  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  namespace  = kubernetes_namespace.argocd.metadata.0.name
  version    = "5.52.1"
  #values     = [file("${path.module}/values/argocd.yaml")]
  depends_on = [kubernetes_namespace.argocd, var.fargate_profile_arn]
}