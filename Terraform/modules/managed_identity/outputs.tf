output "id" {
  description = "The ID of the user-assigned managed identity"
  value       = azurerm_user_assigned_identity.identity.id
}

output "principal_id" {
  description = "The principal ID (object ID) of the user-assigned managed identity"
  value       = azurerm_user_assigned_identity.identity.principal_id
}

output "client_id" {
  description = "The client ID of the user-assigned managed identity"
  value       = azurerm_user_assigned_identity.identity.client_id
}

output "tenant_id" {
  description = "The tenant ID where the identity is created"
  value       = azurerm_user_assigned_identity.identity.tenant_id
}
