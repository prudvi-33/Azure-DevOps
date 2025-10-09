variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "Azure region where the registry will be deployed"
}

variable "name" {
  type        = string
  description = "Name of the container registry"
}

variable "sku" {
  type        = string
  description = "SKU of the container registry"
  default     = "Basic"
}

variable "admin_enabled" {
  type        = bool
  description = "Enable admin user"
  default     = true
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to the registry"
  default     = {}
}

variable "retention_policy_days" {
  type        = number
  description = "Number of days to retain images for"
  default     = 7
}

variable "retention_policy_enabled" {
  type        = bool
  description = "Enable retention policy"
  default     = false
}

variable "trust_policy_enabled" {
  type        = bool
  description = "Enable trust policy"
  default     = false
}
