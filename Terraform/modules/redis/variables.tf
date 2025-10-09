variable "name" {
  description = "Name of the Redis Cache"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "sku_name" {
  description = "SKU name of the Redis Cache"
  type        = string
  default     = "Basic"
}

variable "family" {
  description = "SKU family"
  type        = string
  default     = "C"
}

variable "capacity" {
  description = "SKU capacity"
  type        = number
  default     = 0
}

variable "enable_non_ssl_port" {
  description = "Enable non-SSL port"
  type        = bool
  default     = false
}

variable "minimum_tls_version" {
  description = "Minimum TLS version"
  type        = string
  default     = "1.2"
}

variable "public_network_access_enabled" {
  description = "Enable public network access"
  type        = bool
  default     = true
}

variable "maxmemory_reserved" {
  description = "Max memory reserved"
  type        = string
  default     = "30"
}

variable "maxmemory_delta" {
  description = "Max memory delta"
  type        = string
  default     = "30"
}

variable "maxfragmentationmemory_reserved" {
  description = "Max fragmentation memory reserved"
  type        = string
  default     = "30"
}

variable "tags" {
  description = "Tags to apply to the Redis Cache"
  type        = map(string)
  default     = {}
}

variable "create_private_endpoint" {
  description = "Create a private endpoint for the Redis Cache"
  type        = bool
  default     = true
}

variable "private_endpoint_name" {
  description = "Name of the private endpoint"
  type        = string
  default     = null
}

variable "subnet_id" {
  description = "Subnet ID for the private endpoint"
  type        = string
  default     = null
}

variable "vnet_id" {
  description = "ID of the Virtual Network to link with private DNS zone"
  type        = string
}

variable "private_dns_zone_ids" {
  description = "Private DNS Zone IDs for the private endpoint"
  type        = list(string)
  default     = null
}
