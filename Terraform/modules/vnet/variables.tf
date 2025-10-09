variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "Azure region where the VNet will be deployed"
}

variable "vnet_name" {
  type        = string
  description = "Name of the Virtual Network"
}

variable "address_space" {
  type        = list(string)
  description = "Address space for the Virtual Network"
}

variable "subnets" {
  type = map(object({
    address_prefix = string
    service_endpoints = optional(list(string), null)
    delegations = optional(list(object({
      name = string
      service_delegation = object({
        name    = string
        actions = list(string)
      })
    })), null)
    private_endpoint_network_policies_enabled = optional(bool, null)
    private_link_service_network_policies_enabled = optional(bool, null)
  }))
  description = "Map of subnet configurations"
}

variable "peerings" {
  type = map(object({
    remote_virtual_network_id = string
    allow_virtual_network_access = optional(bool, true)
    allow_forwarded_traffic = optional(bool, false)
    allow_gateway_transit = optional(bool, false)
    use_remote_gateways = optional(bool, false)
  }))
  description = "Map of VNet peering configurations"
  default     = {}
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to the VNet"
  default     = {}
}
