output "id" {
  description = "The ID of the Redis Cache"
  value       = azurerm_redis_cache.redis.id
}

output "name" {
  description = "The name of the Redis Cache"
  value       = azurerm_redis_cache.redis.name
}

output "hostname" {
  description = "The hostname of the Redis Cache"
  value       = azurerm_redis_cache.redis.hostname
}

output "ssl_port" {
  description = "The SSL port of the Redis Cache"
  value       = azurerm_redis_cache.redis.ssl_port
}

output "port" {
  description = "The non-SSL port of the Redis Cache"
  value       = azurerm_redis_cache.redis.port
}

output "primary_access_key" {
  description = "The primary access key for the Redis Cache"
  value       = azurerm_redis_cache.redis.primary_access_key
  sensitive   = true
}

output "secondary_access_key" {
  description = "The secondary access key for the Redis Cache"
  value       = azurerm_redis_cache.redis.secondary_access_key
  sensitive   = true
}

output "private_endpoint_id" {
  description = "The ID of the Private Endpoint"
  value       = var.create_private_endpoint ? azurerm_private_endpoint.redis_pe[0].id : null
}

output "private_dns_zone_id" {
  description = "The ID of the Private DNS Zone"
  value       = var.private_dns_zone_ids != null ? var.private_dns_zone_ids[0] : (length(azurerm_private_dns_zone.redis) > 0 ? azurerm_private_dns_zone.redis[0].id : null)
}
