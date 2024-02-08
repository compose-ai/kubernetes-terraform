locals {
  template_vars = {
    cluster_name     = azurerm_kubernetes_cluster.current.name
    cluster_endpoint = azurerm_kubernetes_cluster.current.kube_config[0].host
    cluster_ca       = azurerm_kubernetes_cluster.current.kube_config[0].cluster_ca_certificate
    client_cert      = azurerm_kubernetes_cluster.current.kube_config[0].client_certificate
    client_key       = azurerm_kubernetes_cluster.current.kube_config[0].client_key
    username         = azurerm_kubernetes_cluster.current.kube_config[0].username
    password         = azurerm_kubernetes_cluster.current.kube_config[0].password
    path_cwd         = path.cwd
  }

  kubeconfig = templatefile("${path.module}/templates/kubeconfig.tpl", local.template_vars)
}
