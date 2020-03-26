resource "aws_eks_node_group" "gitlab-nodegroup" {
  cluster_name    = "${aws_eks_cluster.gitlab.name}"
  node_group_name = "${var.node_group_name}"
  node_role_arn   = "${aws_iam_role.gitlab-nodegroup.arn}"
  subnet_ids      = ["${aws_subnet.subnet-1.id}", "${aws_subnet.subnet-2.id}"]
	instance_types		=	"${var.instance_types}"
	ami_type				=	"${var.ami_type}"
	disk_size				= "${var.disk_size}"

  scaling_config {
    desired_size = "${var.desired_size}"
    max_size     = "${var.desired_size}"
    min_size     = 1
  }

  depends_on = [
    "aws_iam_role_policy_attachment.gitlab-AmazonEKSWorkerNodePolicy",
    "aws_iam_role_policy_attachment.gitlab-AmazonEKS_CNI_Policy",
    "aws_iam_role_policy_attachment.gitlab-AmazonEC2ContainerRegistryReadOnly",
  ]
}