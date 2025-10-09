variable "name" {
  description = "The name of the user-assigned managed identity"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the identity will be created"
  type        = string
}

variable "location" {
  description = "The Azure region where the identity will be created"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the identity"
  type        = map(string)
  default     = {}
}

variable "role_assignments" {
  description = "Role assignments to create for the identity"
  type = map(object({
    scope                = string
    role_definition_name = string
  }))
  default = {}
}
