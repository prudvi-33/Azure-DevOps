variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "Azure region where the key vault will be deployed"
}

variable "name" {
  type        = string
  description = "Name of the key vault"
}

variable "tenant_id" {
  type        = string
  description = "Azure AD tenant ID"
}

variable "sku_name" {
  type        = string
  description = "SKU of the key vault"
  default     = "standard"
}

variable "soft_delete_retention_days" {
  type        = number
  description = "Soft delete retention days"
  default     = 90
}

variable "purge_protection_enabled" {
  type        = bool
  description = "Enable purge protection"
  default     = false
}

variable "enabled_for_disk_encryption" {
  type        = bool
  description = "Enable for disk encryption"
  default     = false
}

variable "enabled_for_deployment" {
  type        = bool
  description = "Enable for deployment"
  default     = false
}

variable "enabled_for_template_deployment" {
  type        = bool
  description = "Enable for template deployment"
  default     = false
}

variable "enable_rbac_authorization" {
  type        = bool
  description = "Enable RBAC authorization"
  default     = false
}

variable "public_network_access_enabled" {
  type        = bool
  description = "Enable public network access"
  default     = true
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to the key vault"
  default     = {}
}

variable "network_acls" {
  description = "Network ACLs for the key vault"
  type = object({
    bypass                     = string
    default_action             = string
    ip_rules                   = list(string)
    virtual_network_subnet_ids = list(string)
  })
  default = null
}

variable "access_policies" {
  description = "Access policies for the key vault"
  type = map(object({
    object_id               = string
    key_permissions         = optional(list(string), [])
    secret_permissions      = optional(list(string), [])
    certificate_permissions = optional(list(string), [])
    storage_permissions     = optional(list(string), [])
  }))
  default = {}
}

variable "create_private_endpoint" {
  description = "Create a private endpoint for the Key Vault"
  type        = bool
  default     = false
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
  default     = null
}

variable "private_dns_zone_ids" {
  description = "Private DNS Zone IDs for the private endpoint"
  type        = list(string)
  default     = null
}
