variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "Azure region where the storage account will be deployed"
}

variable "name" {
  type        = string
  description = "Name of the storage account"
}

variable "account_tier" {
  type        = string
  description = "Storage account tier"
  default     = "Standard"
}

variable "account_replication_type" {
  type        = string
  description = "Storage account replication type"
  default     = "LRS"
}

variable "account_kind" {
  type        = string
  description = "Storage account kind"
  default     = "StorageV2"
}

variable "access_tier" {
  type        = string
  description = "Storage account access tier"
  default     = "Hot"
}

variable "enable_https_traffic_only" {
  type        = bool
  description = "Whether to enable HTTPS traffic only"
  default     = true
}

variable "min_tls_version" {
  type        = string
  description = "Minimum TLS version"
  default     = "TLS1_2"
}

variable "is_hns_enabled" {
  type        = bool
  description = "Whether Hierarchical Namespace is enabled"
  default     = false
}

variable "nfsv3_enabled" {
  type        = bool
  description = "Whether NFSv3 is enabled"
  default     = false
}

variable "shared_access_key_enabled" {
  type        = bool
  description = "Whether shared access key is enabled"
  default     = true
}

variable "public_network_access_enabled" {
  type        = bool
  description = "Whether public network access is enabled"
  default     = false
}

variable "large_file_share_enabled" {
  type        = bool
  description = "Whether large file shares are enabled"
  default     = true
}

variable "cross_tenant_replication_enabled" {
  type        = bool
  description = "Whether cross-tenant replication is enabled"
  default     = false
}

variable "network_default_action" {
  type        = string
  description = "Default action for network rules"
  default     = "Deny"
}

variable "ip_rules" {
  type        = list(string)
  description = "List of IP rules for network ACLs"
  default     = []
}

variable "virtual_network_subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs for network rules"
  default     = []
}

variable "network_bypass" {
  type        = list(string)
  description = "Network bypass options for network rules"
  default     = ["AzureServices"]
}

variable "create_private_endpoint" {
  type        = bool
  description = "Whether to create a private endpoint for the storage account"
  default     = true
}

variable "private_endpoint_name" {
  type        = string
  description = "Name of the private endpoint resource"
  default     = null
}

variable "subnet_id" {
  type        = string
  description = "ID of the subnet where the private endpoint will be created"
  default     = null
}

variable "vnet_id" {
  type        = string
  description = "ID of the Virtual Network to link with private DNS zone"
}

variable "private_endpoint_subresources" {
  type        = list(string)
  description = "List of subresources for the private endpoint"
  default     = ["blob"]
}

variable "private_dns_zone_ids" {
  type        = list(string)
  description = "List of private DNS zone IDs for the private endpoint"
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to the storage account"
  default     = {}
}

variable "containers" {
  type = list(object({
    name                  = string
    container_access_type = optional(string, "private")
    metadata              = optional(map(string), {})
  }))
  description = "List of containers to create in the storage account"
  default     = []
}
