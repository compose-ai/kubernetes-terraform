variable "metadata_name" {
  type        = string
  description = "Metadata name to use."
}

variable "metadata_fqdn" {
  type        = string
  description = "DNS name of the zone. E.g. `infra.example.com`"
}

variable "metadata_labels" {
  type        = map(string)
  description = "Metadata labels to use."
}

variable "availability_zones" {
  description = "List of availability_zones for workers."
  type        = list(string)
}

variable "vpc_cidr" {
  description = "CIDR to use for the VPC."
  type        = string
}

variable "vpc_legacy_node_subnets" {
  description = "Whether to keep the legacy node subnets for backwards compatibility."
  type        = bool
  default     = false
}

variable "vpc_control_subnet_newbits" {
  description = "CIDR newbits to use for the control plane subnets."
  type        = string
}

variable "vpc_node_subnet_newbits" {
  description = "CIDR newbits to use for the node pool subnets."
  type        = string
}

variable "vpc_node_subnet_number_offset" {
  description = "CIDR subnet number offset to use for the node pool subnets."
  type        = string
}

variable "vpc_subnet_map_public_ip" {
  description = "Whether nodes should have public IPs."
  type        = bool
}

variable "instance_types" {
  description = "Set of AWS instance types to use for nodes."
  type        = set(string)
}

variable "desired_capacity" {
  description = "Desired number of worker nodes."
  type        = string
}

variable "max_size" {
  description = "Maximum number of worker nodes."
  type        = string
}

variable "min_size" {
  description = "Minimum number of worker nodes."
  type        = string
}

variable "root_device_encrypted" {
  type        = bool
  default     = true
  description = "Whether to encrypt root device volumes of worker nodes."
}

variable "root_device_volume_size" {
  type        = number
  default     = 20
  description = "Size in GB for root device volumes of worker nodes."
}

variable "taints" {
  type = set(object({
    key    = string
    value  = string
    effect = string
  }))
  description = "Kubernetes taints to set for node pool."
}

variable "additional_node_tags" {
  type        = map(string)
  default     = {}
  description = "Additional AWS tags to set on the node pool."
}

variable "disable_default_ingress" {
  type        = bool
  description = "Whether to disable the default ingress."
}

variable "enabled_cluster_log_types" {
  type        = list(string)
  description = "List of cluster log types to enable."
}

variable "disable_openid_connect_provider" {
  type        = bool
  description = "Whether to disable the OpenID connect provider."
}

variable "cluster_version" {
  type        = string
  default     = null
  description = "The version of the cluster (defaults to latest available)"
}

variable "cluster_endpoint_private_access" {
  type        = bool
  default     = false
  description = "Whether the Amazon EKS private API server endpoint is enabled (making the kubernetes API endpoint accessible from the internal network)."
}

variable "cluster_endpoint_public_access" {
  type        = bool
  default     = true
  description = "Whether the Amazon EKS public API server endpoint is enabled (making the kubernetes API endpoint accessible from the public internet)."
}

variable "cluster_public_access_cidrs" {
  type        = list(string)
  default     = null
  description = "List of CIDR blocks which can access the Amazon EKS public API server endpoint. EKS defaults this to a list with 0.0.0.0/0."
}
