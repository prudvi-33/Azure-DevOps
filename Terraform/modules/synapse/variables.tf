# # Basic Resource Variables
 variable "name" {
   type        = string
   description = "Name of the Synapse Workspace"
 }

# variable "private_endpoint_subnet_id" {
   type        = string
   description = "Subnet ID for Private Endpoint"
   default     = null
 }

# # Synapse Firewall Rules
 variable "synapse_firewall_rules" {
   type = map(object({
     start_ip_address = string
     end_ip_address   = string
   }))
   description = "Map of Synapse Workspace Firewall Rules"
   default     = {}
 }

# # Tagging
 variable "tags" {
   type        = map(string)
   description = "Tags to apply to resources"
   default     = {}
 }

 variable "resource_group_name" {
   type        = string
   description = "Resource Group Name"
 }

 variable "location" {
   type        = string
   description = "Azure Region"
 }

# # Authentication Variables
 variable "sql_admin_username" {
   type        = string
   description = "SQL Administrator Username"
 }

 variable "sql_admin_password" {
   type        = string
   description = "SQL Administrator Password"
   sensitive   = true
 }

# # Storage Account Variables
 variable "storage_account_name" {
   type        = string
   description = "Storage Account Name for Data Lake"
 }

 variable "storage_account_tier" {
   type        = string
   description = "Defines the Tier to use for this storage account"
   default     = "Standard"
   validation {
     condition     = contains(["Standard", "Premium"], var.storage_account_tier)
     error_message = "Storage account tier must be either 'Standard' or 'Premium'."
   }
 }

 variable "storage_account_replication_type" {
   type        = string
   description = "Defines the type of replication to use for this storage account"
   default     = "LRS"
   validation {
     condition     = contains(["LRS", "GRS", "RAGRS", "ZRS", "GZRS", "RAGZRS"], var.storage_account_replication_type)
     error_message = "Storage account replication type must be one of: LRS, GRS, RAGRS, ZRS, GZRS, RAGZRS."
   }
 }

 variable "storage_account_kind" {
   type        = string
   description = "Defines the kind of storage account"
   default     = "StorageV2"
   validation {
     condition     = contains(["Storage", "StorageV2", "BlobStorage", "FileStorage", "BlockBlobStorage"], var.storage_account_kind)
     error_message = "Storage account kind must be one of: Storage, StorageV2, BlobStorage, FileStorage, BlockBlobStorage."
   }
 }

 variable "storage_is_hns_enabled" {
   type        = bool
   description = "Is Hierarchical Namespace enabled for this storage account"
   default     = true
 }

 variable "filesystem_name" {
   type        = string
   description = "Name of the Data Lake Filesystem"
   default     = "workspace"
 }

# # Identity and Network Variables
 variable "identity_type" {
   type        = string
   description = "Type of Managed Identity"
   default     = "SystemAssigned"
   validation {
     condition     = var.identity_type == null ? true : contains(["SystemAssigned", "UserAssigned", "None"], var.identity_type)
     error_message = "Identity type must be one of: SystemAssigned, UserAssigned, None."
   }
 }

 variable "public_network_access_enabled" {
   type        = bool
   description = "Enable Public Network Access"
   default     = true
 }

 variable "azuread_only_authentication" {
   type        = bool
   description = "Enable Azure AD Only Authentication"
   default     = false
 }

 variable "trusted_service_bypass_enabled" {
   type        = bool
   description = "Enable Trusted Service Bypass"
   default     = false
 }

# # Network Security Variables
 variable "allowed_ip_ranges" {
   type        = list(string)
   description = "List of IP ranges to whitelist"
   default     = []
 }

 variable "allowed_subnet_ids" {
   type        = list(string)
   description = "List of Subnet IDs to whitelist"
   default     = []
 }

# # Private Endpoint Variables
 variable "enable_private_endpoint" {
   type        = bool
   description = "Enable Private Endpoint"
   default     = false
 }
