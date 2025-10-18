terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }

  required_version = ">= 1.5.0"
}

provider "azurerm" {
  features {}
  use_cli         = true
  subscription_id = var.subscription_id
  tenant_id       = "215b7ce2-5263-4593-a622-da030405d151"
}
