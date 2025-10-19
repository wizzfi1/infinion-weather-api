variable "location" {
  description = "Azure region to deploy resources"
  type        = string
  default     = "uksouth"  
}

variable "resource_group_name" {
  description = "The name of the Azure Resource Group"
  type        = string
  default     = "Wisdom"
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