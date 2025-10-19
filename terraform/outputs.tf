output "resource_group_name" {
  description = "The name of the resource group"
  value       = azurerm_resource_group.rg.name
}

output "acr_name" {
  description = "The name of the Azure Container Registry"
  value       = azurerm_container_registry.acr.name
}

output "aks_cluster_name" {
  description = "The name of the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks.name
}

output "kube_config" {
  description = "Kubernetes config to access the cluster"
  value       = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive   = true
}

output "acr_login_server" {
  description = "The login server URL for ACR"
  value       = azurerm_container_registry.acr.login_server
}