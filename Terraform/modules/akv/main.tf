# Create Private DNS Zone if not provided
resource "azurerm_private_dns_zone" "keyvault" {
  count               = var.create_private_endpoint && var.private_dns_zone_ids == null ? 1 : 0
  name                = "privatelink.vaultcore.azure.net"
  resource_group_name = var.resource_group_name
  
  tags = var.tags
}

# Create VNet link for Private DNS Zone
resource "azurerm_private_dns_zone_virtual_network_link" "keyvault" {
  count                 = var.create_private_endpoint && (var.private_dns_zone_ids != null || length(azurerm_private_dns_zone.keyvault) > 0) ? 1 : 0
  name                  = "link-to-vnet"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = var.private_dns_zone_ids != null ? var.private_dns_zone_ids[0] : azurerm_private_dns_zone.keyvault[0].name
  virtual_network_id    = var.vnet_id
}

# Private Endpoint
resource "azurerm_private_endpoint" "keyvault_pe" {
  count               = var.create_private_endpoint ? 1 : 0
  name                = var.private_endpoint_name != null ? var.private_endpoint_name : "pe-${var.name}"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "${var.name}-connection"
    private_connection_resource_id = azurerm_key_vault.keyvault.id
    is_manual_connection           = false
    subresource_names              = ["vault"]
  }

  dynamic "private_dns_zone_group" {
    for_each = var.create_private_endpoint && (var.private_dns_zone_ids != null || length(azurerm_private_dns_zone.keyvault) > 0) ? [1] : []
    content {
      name                 = "default"
      private_dns_zone_ids = var.private_dns_zone_ids != null ? var.private_dns_zone_ids : [azurerm_private_dns_zone.keyvault[0].id]
    }
  }
  
  lifecycle {
    ignore_changes = [
      private_dns_zone_group,
      tags
    ]
  }

  depends_on = [
    azurerm_private_dns_zone_virtual_network_link.keyvault
  ]

}

resource "azurerm_key_vault" "keyvault" {
  name                        = var.name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  tenant_id                   = var.tenant_id
  sku_name                    = var.sku_name
  soft_delete_retention_days  = var.soft_delete_retention_days
  purge_protection_enabled    = var.purge_protection_enabled
  enabled_for_disk_encryption = var.enabled_for_disk_encryption
  enabled_for_deployment      = var.enabled_for_deployment
  enabled_for_template_deployment = var.enabled_for_template_deployment
  enable_rbac_authorization   = var.enable_rbac_authorization
  public_network_access_enabled = var.public_network_access_enabled
  tags                        = var.tags

  dynamic "network_acls" {
    for_each = var.network_acls != null ? [var.network_acls] : []
    content {
      bypass                     = network_acls.value.bypass
      default_action             = network_acls.value.default_action
      ip_rules                   = network_acls.value.ip_rules
      virtual_network_subnet_ids = network_acls.value.virtual_network_subnet_ids
    }
  }

  lifecycle {
    prevent_destroy = false
    ignore_changes = [
      tags
    ]
  }
}

# Only create access policies if specified and object_id is not null
resource "azurerm_key_vault_access_policy" "access_policies" {
  for_each = {
    for k, v in var.access_policies : k => v
    if v.object_id != null
  }

  key_vault_id = azurerm_key_vault.keyvault.id
  tenant_id    = var.tenant_id
  object_id    = each.value.object_id

  key_permissions         = lookup(each.value, "key_permissions", [])
  secret_permissions      = lookup(each.value, "secret_permissions", [])
  certificate_permissions = lookup(each.value, "certificate_permissions", [])
  storage_permissions     = lookup(each.value, "storage_permissions", [])
}
