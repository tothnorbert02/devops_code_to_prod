output "resource_group_name" {
  value       = azurerm_resource_group.rg.name
  description = "A létrehozott resource group neve"
}

output "container_group_fqdn" {
  value       = azurerm_container_group.app.fqdn
  description = "A futó konténer publikus FQDN címe"
}