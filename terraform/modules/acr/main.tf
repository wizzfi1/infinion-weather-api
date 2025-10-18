variable "resource_group_name" { type = string }
variable "location"            { type = string }
variable "acr_name"            { type = string }

resource "azurerm_container_registry" "this" {
  name                = lower(replace(var.acr_name, "_", ""))
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "Standard"
  admin_enabled       = false
  tags = {
    project = "infinion-weather-api"
  }
}

output "acr_name" {
  value = azurerm_container_registry.this.name
}

output "acr_login_server" {
  value = azurerm_container_registry.this.login_server
}
