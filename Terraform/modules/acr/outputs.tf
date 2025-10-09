output "id" {
  description = "The ID of the Container Registry"
  value       = azurerm_container_registry.acr.id
}

output "name" {
  description = "The name of the Container Registry"
  value       = azurerm_container_registry.acr.name
}

output "login_server" {
  description = "The login server URL of the Container Registry"
  value       = azurerm_container_registry.acr.login_server
}

output "admin_username" {
  description = "The admin username of the Container Registry"
  value       = azurerm_container_registry.acr.admin_username
}

output "admin_password" {
  description = "The admin password of the Container Registry"
  value       = azurerm_container_registry.acr.admin_password
  sensitive   = true
}
