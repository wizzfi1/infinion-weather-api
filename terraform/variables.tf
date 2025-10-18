variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
  default     = ""
}

variable "tenant_id" {
  description = "Azure Tenant ID"
  type        = string
  default     = ""
}

variable "client_id" {
  description = "Azure Service Principal Client ID"
  type        = string
  default     = ""
  sensitive   = true
}

variable "client_secret" {
  description = "Azure Service Principal Client Secret"
  type        = string
  default     = ""
  sensitive   = true
}


variable "location" {
  description = "Azure region to deploy resources"
  type        = string
  default     = "eastus"
}

variable "resource_group_name" {
  description = "The name of the Azure Resource Group to create or use"
  type        = string
  default     = "infinion-devops-rg"
}


variable "aks_cluster_name" {
  description = "The name of the AKS cluster"
  type        = string
  default     = "infinion-aks-cluster"
}

variable "node_count" {
  description = "Number of nodes in the AKS cluster"
  type        = number
  default     = 1
}

variable "vm_size" {
  description = "The size of the VMs for AKS nodes"
  type        = string
  default     = "Standard_B2s"
}
