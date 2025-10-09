resource "azurerm_private_dns_zone" "storage" {
  count               = var.private_dns_zone_ids == null ? 1 : 0
  # name                = "privatelink.blob.storage.core.windows.net"
  name                 = "privatelink.blob.core.windows.net"
  resource_group_name = var.resource_group_name
  
  tags = var.tags
}

# Create VNet link for Private DNS Zone
resource "azurerm_private_dns_zone_virtual_network_link" "storage" {
  count                 = var.private_dns_zone_ids != null || length(azurerm_private_dns_zone.storage) > 0 ? 1 : 0
  name                  = "link-to-vnet"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = var.private_dns_zone_ids != null ? var.private_dns_zone_ids[0] : azurerm_private_dns_zone.storage[0].name
  virtual_network_id    = var.vnet_id
}

# Storage Account Resource
resource "azurerm_storage_account" "storage" {
  name                            = var.name
  resource_group_name             = var.resource_group_name
  location                        = var.location
  account_tier                    = var.account_tier
  account_replication_type        = var.account_replication_type
  account_kind                    = var.account_kind
  access_tier                     = var.access_tier
  enable_https_traffic_only       = var.enable_https_traffic_only
  min_tls_version                 = var.min_tls_version
  allow_nested_items_to_be_public = false
  is_hns_enabled                  = var.is_hns_enabled
  nfsv3_enabled                   = var.nfsv3_enabled
  shared_access_key_enabled       = var.shared_access_key_enabled
  public_network_access_enabled   = var.public_network_access_enabled
  large_file_share_enabled        = var.large_file_share_enabled
  cross_tenant_replication_enabled = var.cross_tenant_replication_enabled
  tags                            = var.tags

  network_rules {
    default_action              = var.network_default_action
    ip_rules                    = var.ip_rules
    virtual_network_subnet_ids  = var.virtual_network_subnet_ids
    bypass                      = var.network_bypass
  }
  
  lifecycle {
    prevent_destroy = false
    ignore_changes = [
      tags
    ]
  }
}

# Private Endpoint Resource
resource "azurerm_private_endpoint" "storage_endpoint" {
  count               = var.create_private_endpoint ? 1 : 0
  name                = var.private_endpoint_name != null ? var.private_endpoint_name : "pe-${var.name}"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "${var.private_endpoint_name != null ? var.private_endpoint_name : "pe-${var.name}"}-connection"
    private_connection_resource_id = azurerm_storage_account.storage.id
    is_manual_connection           = false
    subresource_names              = var.private_endpoint_subresources
  }

  dynamic "private_dns_zone_group" {
    for_each = var.private_dns_zone_ids != null || length(azurerm_private_dns_zone.storage) > 0 ? [1] : []
    content {
      name                 = "default"
      private_dns_zone_ids = var.private_dns_zone_ids != null ? var.private_dns_zone_ids : [azurerm_private_dns_zone.storage[0].id]
    }
  }
  
  # lifecycle {
  #   ignore_changes = [
  #     private_dns_zone_group,
  #     private_service_connection,
  #     tags,
  #     custom_dns_configs,
  #     network_interface,
  #     private_dns_zone_configs
  #   ]
  # }
}

# Create containers in the storage account
resource "azurerm_storage_container" "containers" {
  for_each              = { for container in var.containers : container.name => container }
  name                  = each.value.name
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = lookup(each.value, "container_access_type", "private")
  metadata              = lookup(each.value, "metadata", {})
}
