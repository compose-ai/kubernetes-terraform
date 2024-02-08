output "aks_vnet" {
  value = length(azurerm_virtual_network.current) > 0 ? azurerm_virtual_network.current[0] : null
}

output "kubeconfig" {
  sensitive = true
  value     = local.kubeconfig
}

output "default_ingress_ip" {
  value = length(azurerm_public_ip.current) > 0 ? azurerm_public_ip.current[0].ip_address : null
}

output "oidc_issuer_url" {
  value = azurerm_kubernetes_cluster.current.oidc_issuer_url
}
