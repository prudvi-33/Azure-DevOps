output "id" {
  description = "The ID of the Key Vault"
  value       = azurerm_key_vault.keyvault.id
}

output "name" {
  description = "The name of the Key Vault"
  value       = azurerm_key_vault.keyvault.name
}

output "vault_uri" {
  description = "The URI of the Key Vault"
  value       = azurerm_key_vault.keyvault.vault_uri
}

output "private_endpoint_id" {
  description = "The ID of the Private Endpoint"
  value       = var.create_private_endpoint ? azurerm_private_endpoint.keyvault_pe[0].id : null
}

output "private_dns_zone_id" {
  description = "The ID of the Private DNS Zone"
  value       = var.private_dns_zone_ids != null ? var.private_dns_zone_ids[0] : (length(azurerm_private_dns_zone.keyvault) > 0 ? azurerm_private_dns_zone.keyvault[0].id : null)
}
