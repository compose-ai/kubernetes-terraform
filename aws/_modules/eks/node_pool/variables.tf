variable "metadata_labels" {
  type        = map(string)
  description = "Metadata labels to use."
}

variable "eks_metadata_tags" {
  type        = map(any)
  description = "EKS metadata tags to use."
}

variable "cluster_name" {
  type        = string
  description = "Cluster name of the EKS cluster."
}

variable "node_group_name" {
  type        = string
  description = "Name for this node pool."
}

variable "role_arn" {
  type        = string
  description = "ARN of the IAM role for worker nodes."
}

variable "instance_types" {
  type        = set(string)
  description = "Set of AWS instance types to use for nodes."
}

variable "desired_size" {
  type        = string
  description = "Desired number of worker nodes."
}

variable "max_size" {
  type        = string
  description = "Maximum number of worker nodes."
}

variable "min_size" {
  type        = string
  description = "Minimum number of worker nodes."
}

variable "disk_size" {
  type        = string
  default     = "20"
  description = "Will set the volume size of the root device"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of VPC subnet IDs to use for nodes."
}

variable "taints" {
  type = set(object({
    key    = string
    value  = string
    effect = string
  }))
  description = "Kubernetes taints to set for node pool."
}

variable "tags" {
  type        = map(string)
  description = "AWS tags to set on the node pool. Merged with Kubestack default tags."
  default     = {}
}

variable "labels" {
  type        = map(string)
  description = "Kubernetes labels to set on the nodes created by the node pool. Merged with Kubestack default labels."
  default     = {}
}

variable "ami_type" {
  type        = string
  description = "AMI type to use for nodes of the node pool."
}

variable "kubernetes_version" {
  type        = string
  description = "Kubernetes version to use for node pool."
}
