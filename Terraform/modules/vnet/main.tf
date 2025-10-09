resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
  tags                = var.tags

  lifecycle {
    ignore_changes = [
      tags,
      subnet
    ]
  }
}

resource "azurerm_subnet" "subnets" {
  for_each = var.subnets

  name                 = each.key
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [each.value.address_prefix]

  service_endpoints = each.value.service_endpoints

  dynamic "delegation" {
    for_each = each.value.delegations != null ? each.value.delegations : []
    content {
      name = delegation.value.name
      
      service_delegation {
        name    = delegation.value.service_delegation.name
        actions = delegation.value.service_delegation.actions
      }
    }
  }

  private_endpoint_network_policies_enabled     = coalesce(each.value.private_endpoint_network_policies_enabled, true)
  private_link_service_network_policies_enabled = coalesce(each.value.private_link_service_network_policies_enabled, true)

  lifecycle {
    ignore_changes = [
      # private_endpoint_network_policies_enabled,
      private_link_service_network_policies_enabled,
      service_endpoints,
      delegation
    ]
  }
}

resource "azurerm_virtual_network_peering" "peerings" {
  for_each = var.peerings

  name                         = each.key
  resource_group_name          = var.resource_group_name
  virtual_network_name         = azurerm_virtual_network.vnet.name
  remote_virtual_network_id    = each.value.remote_virtual_network_id
  allow_virtual_network_access = lookup(each.value, "allow_virtual_network_access", true)
  allow_forwarded_traffic      = lookup(each.value, "allow_forwarded_traffic", false)
  allow_gateway_transit        = lookup(each.value, "allow_gateway_transit", false)
  use_remote_gateways          = lookup(each.value, "use_remote_gateways", false)
}
