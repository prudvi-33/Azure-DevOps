output "id" {
  description = "The ID of the Storage Account"
  value       = azurerm_storage_account.storage.id
}

output "name" {
  description = "The name of the Storage Account"
  value       = azurerm_storage_account.storage.name
}

output "primary_blob_endpoint" {
  description = "The primary blob endpoint of the Storage Account"
  value       = azurerm_storage_account.storage.primary_blob_endpoint
}

output "primary_file_endpoint" {
  description = "The primary file endpoint of the Storage Account"
  value       = azurerm_storage_account.storage.primary_file_endpoint
}

output "primary_web_endpoint" {
  description = "The primary web endpoint of the Storage Account"
  value       = azurerm_storage_account.storage.primary_web_endpoint
}

output "primary_access_key" {
  description = "The primary access key of the Storage Account"
  value       = azurerm_storage_account.storage.primary_access_key
  sensitive   = true
}

output "secondary_access_key" {
  description = "The secondary access key of the Storage Account"
  value       = azurerm_storage_account.storage.secondary_access_key
  sensitive   = true
}

output "private_endpoint_id" {
  description = "The ID of the Storage Account Private Endpoint"
  value       = var.create_private_endpoint ? azurerm_private_endpoint.storage_endpoint[0].id : null
}

output "private_dns_zone_id" {
  description = "The ID of the Private DNS Zone"
  value       = var.private_dns_zone_ids != null ? var.private_dns_zone_ids[0] : (length(azurerm_private_dns_zone.storage) > 0 ? azurerm_private_dns_zone.storage[0].id : null)
}

output "container_ids" {
  description = "Map of container names to their IDs"
  value       = { for k, v in azurerm_storage_container.containers : k => v.id }
}

output "containers" {
  description = "Map of container names to their details"
  value       = azurerm_storage_container.containers
}
