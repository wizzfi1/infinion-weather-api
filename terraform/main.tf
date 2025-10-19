resource "random_id" "acr_suffix" {
  byte_length = 4
}

# Resource Group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
  
  tags = {
    project     = "infinion-weather-api"
    environment = "assessment"
    managed-by  = "terraform"
  }
}

# Azure Container Registry
resource "azurerm_container_registry" "acr" {
  name                = "infinionacr${random_id.acr_suffix.hex}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Basic"
  admin_enabled       = false
  
  tags = {
    project     = "infinion-weather-api"
    environment = "assessment"
  }
}

# AKS Cluster
resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_cluster_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "infinion-aks"
  kubernetes_version  = "1.28.5"  # Fixed specific version

  default_node_pool {
    name       = "default"
    node_count = var.node_count
    vm_size    = var.vm_size
    type       = "VirtualMachineScaleSets"
    # Removed enable_auto_scaling - not supported in default pool
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = "azure"
    network_policy = "azure"
    load_balancer_sku = "standard"
  }

  tags = {
    project     = "infinion-weather-api"
    environment = "assessment"
  }

  depends_on = [azurerm_resource_group.rg]
}

# Give AKS permission to pull from ACR
resource "azurerm_role_assignment" "aks_acr" {
  principal_id                     = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = azurerm_container_registry.acr.id
  skip_service_principal_aad_check = true
  
  depends_on = [
    azurerm_kubernetes_cluster.aks,
    azurerm_container_registry.acr
  ]
}