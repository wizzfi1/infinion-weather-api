terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }

  required_version = ">= 1.5.0"
}


provider "azurerm" {
  features {}

  use_cli = true

  # Force Terraform to use the ARM endpoint only
  environment = "public"
  skip_provider_registration = true
}
