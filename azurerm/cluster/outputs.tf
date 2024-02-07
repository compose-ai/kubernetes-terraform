output "aks_vnet" {
  value = module.cluster.aks_vnet
}

output "current_config" {
  value = module.configuration.merged[terraform.workspace]
}

output "current_metadata" {
  value = module.cluster_metadata
}

output "kubeconfig" {
  sensitive = true
  value     = module.cluster.kubeconfig
}

output "default_ingress_ip" {
  value = module.cluster.default_ingress_ip
}

output "oidc_issuer_url" {
  value = module.cluster.oidc_issuer_url
}
