# Create Private DNS Zone if not provided
resource "azurerm_private_dns_zone" "redis" {
  count               = var.private_dns_zone_ids == null ? 1 : 0
  # name                = "private.link.redis.cache.windows.net"
  name                = "privatelink.redis.cache.windows.net"
  resource_group_name = var.resource_group_name
  
  tags = var.tags
}

# Create VNet link for Private DNS Zone
resource "azurerm_private_dns_zone_virtual_network_link" "redis" {
  count                 = var.private_dns_zone_ids != null || length(azurerm_private_dns_zone.redis) > 0 ? 1 : 0
  name                  = "link-to-vnet"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = var.private_dns_zone_ids != null ? var.private_dns_zone_ids[0] : azurerm_private_dns_zone.redis[0].name
  virtual_network_id    = var.vnet_id
}

resource "azurerm_redis_cache" "redis" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  
  capacity            = var.capacity
  family              = var.family
  sku_name            = var.sku_name
  
  enable_non_ssl_port = var.enable_non_ssl_port
  minimum_tls_version = var.minimum_tls_version
  
  public_network_access_enabled = var.public_network_access_enabled

  redis_configuration {
    maxmemory_reserved                 = var.maxmemory_reserved
    maxmemory_delta                    = var.maxmemory_delta
    maxfragmentationmemory_reserved    = var.maxfragmentationmemory_reserved
  }

  tags = var.tags
}

# Private Endpoint
resource "azurerm_private_endpoint" "redis_pe" {
  count               = var.create_private_endpoint ? 1 : 0
  name                = var.private_endpoint_name != null ? var.private_endpoint_name : "pe-${var.name}"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "${var.name}-connection"
    private_connection_resource_id = azurerm_redis_cache.redis.id
    is_manual_connection           = false
    subresource_names              = ["redisCache"]
  }

  dynamic "private_dns_zone_group" {
    for_each = var.private_dns_zone_ids != null || length(azurerm_private_dns_zone.redis) > 0 ? [1] : []
    content {
      name                 = "default"
      private_dns_zone_ids = var.private_dns_zone_ids != null ? var.private_dns_zone_ids : [azurerm_private_dns_zone.redis[0].id]
    }
  }
  
  lifecycle {
    ignore_changes = [
      private_dns_zone_group,
      tags
    ]
  }
}
