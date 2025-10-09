resource "azurerm_container_registry" "acr" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.sku
  admin_enabled       = var.admin_enabled
  tags                = var.tags

  dynamic "retention_policy" {
    for_each = var.retention_policy_enabled ? [1] : []
    content {
      days    = var.retention_policy_days
      enabled = var.retention_policy_enabled
    }
  }

  dynamic "trust_policy" {
    for_each = var.trust_policy_enabled ? [1] : []
    content {
      enabled = var.trust_policy_enabled
    }
  }

  lifecycle {
    prevent_destroy = false
    ignore_changes = [
      tags
    ]
  }
}
