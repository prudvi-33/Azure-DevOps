variable "name" {
  description = "The name of the PostgreSQL Flexible Server"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure location where the server should be created"
  type        = string
}

variable "administrator_login" {
  description = "The administrator login name"
  type        = string
  default     = "psqladmin"
}

variable "administrator_password" {
  description = "The administrator password"
  type        = string
  sensitive   = true
}

variable "postgres_version" {
  description = "PostgreSQL Server version"
  type        = string
  default     = "15"
}

variable "sku_name" {
  description = "The SKU name for the PostgreSQL Flexible Server"
  type        = string
  default     = "B_Standard_B1ms"
}

variable "storage_size_gb" {
  description = "Storage size in GB"
  type        = number
  default     = 32
}

variable "storage_auto_grow_enabled" {
  description = "Enable storage auto grow"
  type        = bool
  default     = true
}

variable "availability_zone" {
  description = "The availability zone in which the server should be located"
  type        = string
  default     = "2"
}

variable "backup_retention_days" {
  description = "Backup retention days, between 7 and 35"
  type        = number
  default     = 7
}

variable "geo_redundant_backup" {
  description = "Enable geo-redundant backups"
  type        = bool
  default     = false
}

variable "active_directory_auth_enabled" {
  description = "Enable Active Directory authentication"
  type        = bool
  default     = false
}

variable "password_auth_enabled" {
  description = "Enable password authentication"
  type        = bool
  default     = true
}

variable "maintenance_window_enabled" {
  description = "Enable custom maintenance window"
  type        = bool
  default     = false
}

variable "maintenance_window_day_of_week" {
  description = "Day of week for maintenance window (0-Sunday, 6-Saturday)"
  type        = number
  default     = 0
}

variable "maintenance_window_start_hour" {
  description = "Start hour for maintenance window (0-23)"
  type        = number
  default     = 0
}

variable "maintenance_window_start_minute" {
  description = "Start minute for maintenance window (0-59)"
  type        = number
  default     = 0
}

variable "databases" {
  description = "List of databases to create"
  type = list(object({
    name      = string
    charset   = optional(string, "UTF8")
    collation = optional(string, "en_US.utf8")
  }))
  default = []
}

variable "firewall_rules" {
  description = "List of firewall rules to create"
  type = list(object({
    name             = string
    start_ip_address = string
    end_ip_address   = string
  }))
  default = []
}

variable "tags" {
  description = "Tags to apply to the PostgreSQL Flexible Server"
  type        = map(string)
  default     = {}
}

variable "allow_azure_services" {
  description = "Allow public access from any Azure service within Azure to this server"
  type        = bool
  default     = false
}
