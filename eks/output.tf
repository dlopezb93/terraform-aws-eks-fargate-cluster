output "cluster_id" {
value  = aws_eks_cluster.eks_cluster.id
}

output "cluster_name" {
  value = aws_eks_cluster.eks_cluster.name
}

output "fargate_profile_arn" {
  value = aws_eks_fargate_profile.eks_fargate.arn
}