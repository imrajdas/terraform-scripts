output "endpoint" {
  value = "${aws_eks_cluster.gitlab.endpoint}"
}

output "kubeconfig-certificate-authority-data" {
  value = "${aws_eks_cluster.gitlab.certificate_authority.0.data}"
}