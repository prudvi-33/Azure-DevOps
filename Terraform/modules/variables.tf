variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region to use"
  type        = string
}

variable "subscription_id" {
  description = "The Azure subscription ID"
  type        = string
}

// variable "client_id" {
//   description = "Service Principal Client ID"
//   type        = string
//   sensitive   = true
// }

// variable "client_secret" {
//   description = "Service Principal Client Secret"
//   type        = string
//   sensitive   = true
// }

// variable "tenant_id" {
//   description = "Azure Tenant ID"
//   type        = string
//   sensitive   = true
// }

variable "tags" {
  description = "Tags to apply to all resources created"
  type        = map(string)
  default     = {
    created_on = "2025-03-13"
    created_by = "terraform"
  }
}

# # ACR specific variables
variable "container_registries" {
  description = "Map of Container Registries to create"
  type = map(object({
    name                    = string
    sku                     = string
    admin_enabled           = optional(bool, true)
    retention_policy_days   = optional(number, 7)
    retention_policy_enabled = optional(bool, false)
    trust_policy_enabled    = optional(bool, false)
    tags                    = optional(map(string))
  }))
}

## VNET variables
# variable "vnets" {
#   description = "Map of VNets to create"
#   type = map(object({
#     name          = string
#     address_space = list(string)
#     subnets = map(object({
#       address_prefixes = list(string)
#       delegation = optional(list(object({
#         name = string
#         service_delegation = object({
#           name    = string
#           actions = list(string)
#         })
#       })), [])
#       private_endpoint_network_policies_enabled = optional(bool)
#       private_link_service_network_policies_enabled = optional(bool)
#       service_endpoints = optional(list(string))
#     }))
#     tags = optional(map(string))
#   }))
# }



variable "vnets" {
  description = "Map of VNets to create"
  type = map(object({
    name          = string
    address_space = list(string)
    subnets = map(object({
      address_prefix = string
      service_endpoints = optional(list(string))
      delegations = optional(list(object({
        name = string
        service_delegation = object({
          name    = string
          actions = list(string)
        })
      })))
      private_endpoint_network_policies_enabled = optional(bool)
      private_link_service_network_policies_enabled = optional(bool)
    }))
    peerings = optional(map(object({
      remote_virtual_network_id = string
      allow_virtual_network_access = optional(bool, true)
      allow_forwarded_traffic = optional(bool, false)
      allow_gateway_transit = optional(bool, false)
      use_remote_gateways = optional(bool, false)
    })), {})
    tags = optional(map(string), {})
  }))
}





# # AKS Variables
# variable "create_aks" {
#   type        = bool
#   description = "Flag to determine whether to create an AKS cluster"
#   default     = true
# }

# variable "aks_prefix" {
#   type        = string
#   description = "Prefix for AKS resources"
#   default     = "aks"
# }

# variable "kubernetes_version" {
#   type        = string
#   description = "Version of Kubernetes to use for the AKS cluster"
#   default     = "1.26.6"
# }

# variable "aks_network_policy" {
#   type        = string
#   description = "Sets up network policy to be used with Azure CNI"
#   default     = "azure"
# }

# variable "aks_dns_service_ip" {
#   type        = string
#   description = "IP address within the Kubernetes service address range for DNS"
#   default     = "10.0.0.10"
# }

# variable "aks_service_cidr" {
#   type        = string
#   description = "The Network Range used by the Kubernetes service"
#   default     = "10.0.0.0/16"
# }

# variable "aks_pod_cidr" {
#   type        = string
#   description = "The CIDR to use for pod IP addresses"
#   default     = null
# }

# variable "load_balancer_sku" {
#   type        = string
#   description = "The SKU of the Load Balancer used for the AKS cluster"
#   default     = "standard"
# }

# variable "private_cluster_enabled" {
#   type        = bool
#   description = "Should the AKS cluster have its API server only exposed on internal IP addresses"
#   default     = true
# }

# variable "vm_size" {
#   type        = string
#   description = "The size of the Virtual Machine for AKS nodes"
#   default     = "Standard_D2s_v3"
# }

# variable "node_count" {
#   type        = number
#   description = "The initial number of nodes in the default AKS node pool"
#   default     = 1
# }

# variable "max_pods" {
#   type        = number
#   description = "The maximum number of pods per node"
#   default     = 30
# }

# variable "enable_auto_scaling" {
#   type        = bool
#   description = "Enable auto-scaling in the default node pool"
#   default     = true
# }

# variable "min_count" {
#   type        = number
#   description = "The minimum number of nodes when auto-scaling is enabled"
#   default     = 1
# }

# variable "max_count" {
#   type        = number
#   description = "The maximum number of nodes when auto-scaling is enabled"
#   default     = 3
# }

# variable "custom_node_pools" {
#   type        = any
#   description = "Map of node pools to create in addition to the default node pool"
#   default     = {}
# }

# variable "node_pool_defaults" {
#   type = object({
#     enable_auto_scaling   = bool
#     autoscaling_enabled   = optional(bool)
#     enable_node_public_ip = bool
#     node_public_ip_enabled = optional(bool)
#     vm_size               = string
#     os_type               = string
#     os_disk_size_gb       = number
#     node_count            = number
#     min_count             = number
#     max_count             = number
#     max_pods              = number
#     node_labels           = map(string)
#     node_taints           = list(string)
#     zones                 = optional(list(string))
#     enabled               = optional(bool, true)
#   })
#   default = {
#     enable_auto_scaling   = true
#     autoscaling_enabled   = true
#     enable_node_public_ip = false
#     node_public_ip_enabled = false
#     vm_size               = "Standard_DS2_v2"
#     os_type               = "Linux"
#     os_disk_size_gb       = 64
#     node_count            = 1
#     min_count             = 1
#     max_count             = 3
#     max_pods              = 30
#     node_taints           = []
#     node_labels           = {}
#     enabled               = true
#   }
#   description = "Default configuration for AKS node pools"
# }

# variable "enable_log_analytics_workspace" {
#   type        = bool
#   description = "Deploy Log Analytics Workspace for AKS monitoring"
#   default     = true
# }

# variable "log_analytics_workspace_sku" {
#   type        = string
#   description = "The SKU of the Log Analytics workspace"
#   default     = "PerGB2018"
# }

# variable "log_retention_in_days" {
#   type        = number
#   description = "The retention period for logs in days"
#   default     = 30
# }

# variable "azure_policy_enabled" {
#   type        = bool
#   description = "Enable Azure Policy Add-On for AKS"
#   default     = true
# }

# variable "sku_tier" {
#   type        = string
#   description = "The SKU Tier of AKS cluster"
#   default     = "Free"
# }

# variable "oidc_issuer_enabled" {
#   type        = bool
#   description = "Enable OIDC issuer for AKS"
#   default     = true
# }

# variable "workload_identity_enabled" {
#   type        = bool
#   description = "Enable workload identity for AKS"
#   default     = true
# }

# variable "dns_zone_peerings" {
#   type        = any
#   description = "Map of DNS zone peerings for AKS private cluster"
#   default     = {}
# }


# # Azure SQL Server variables
# variable "create_sql" {
#   type        = bool
#   description = "Flag to determine whether to create an Azure SQL Server"
#   default     = true
# }

# variable "sql_server_name" {
#   type        = string
#   description = "The name of the Microsoft SQL Server"
# }

# variable "sql_version" {
#   type        = string
#   description = "The version for the SQL server. Valid values are: 2.0 (for v11 server) and 12.0 (for v12 server)"
#   default     = "12.0"
# }

# variable "sql_admin_username" {
#   type        = string
#   description = "The administrator login name for the SQL server. Will be generated if not provided"
#   default     = null
# }

# variable "sql_admin_password" {
#   type        = string
#   description = "The password associated with the administrator_login user. Will be generated if not provided"
#   default     = null
# }

# variable "sql_public_network_access_enabled" {
#   type        = bool
#   description = "Whether or not public network access is allowed for the SQL server"
#   default     = false
# }

# variable "sql_allow_azure_services" {
#   type        = bool
#   description = "Allow Azure services and resources to access this SQL server"
#   default     = true
# }

# variable "sql_minimum_tls_version" {
#   type        = string
#   description = "The Minimum TLS Version for the SQL server"
#   default     = "1.2"
# }

# variable "sql_connection_policy" {
#   type        = string
#   description = "The connection policy the server will use"
#   default     = "Default"
# }

# variable "sql_firewall_rules" {
#   type = map(object({
#     start_ip_address = string
#     end_ip_address   = string
#   }))
#   description = "A mapping of firewall rules for SQL Server"
#   default     = {}
# }

# variable "sql_network_rules" {
#   type        = map(string)
#   description = "A mapping of virtual network rules for SQL Server"
#   default     = {}
# }

# variable "sql_databases" {
#   type        = any
#   description = "Map of databases to create"
#   default     = {}
# }

# variable "sql_databases_defaults" {
#   type        = any
#   description = "Map of values to be applied to all databases"
#   default     = {}
# }

# variable "sql_elastic_pool_enabled" {
#   type        = bool
#   description = "Whether or not elastic pool should be used"
#   default     = false
# }

# variable "sql_elastic_pool_name" {
#   type        = string
#   description = "Name of SQL elastic pool"
#   default     = null
# }

# variable "sql_elastic_pool" {
#   type = object({
#     max_size_gb               = number
#     sku_name                  = string
#     sku_tier                  = string
#     sku_capacity              = number
#     sku_family                = string
#     per_database_min_capacity = number
#     per_database_max_capacity = number
#   })
#   description = "Configuration of the elastic pool"
#   default = {
#     max_size_gb               = 50
#     sku_name                  = "BasicPool"
#     sku_tier                  = "Basic"
#     sku_capacity              = 50
#     sku_family                = null
#     per_database_min_capacity = 0
#     per_database_max_capacity = 5
#   }
# }

# variable "sql_push_to_kv" {
#   type        = bool
#   description = "Flag to push secrets to KeyVault"
#   default     = true
# }

# # CosmosDB Variables
# variable "cosmosdb_name" {
#   type        = string
#   description = "Name of the CosmosDB account"
#   default     = null
# }

# variable "cosmosdb_private_dns_zone_id" {
#   type        = string
#   description = "ID of the private DNS zone for CosmosDB"
#   default     = null
# }

# variable "cosmosdb_offer_type" {
#   type        = string
#   description = "Offer type for CosmosDB account"
#   default     = "Standard"
# }

# variable "cosmosdb_enable_multiple_write_loc" {
#   type        = bool
#   description = "Enable multiple write locations for CosmosDB"
#   default     = false
# }

# variable "cosmosdb_capabilities" {
#   type        = string
#   description = "The capabilities to enable for CosmosDB"
#   default     = "EnableMongo"
# }

# variable "cosmosdb_consistency_level" {
#   type        = string
#   description = "Consistency level for CosmosDB"
#   default     = "Session"
# }

# variable "cosmosdb_allow_jumpbox_only" {
#   type        = bool
#   description = "Restrict CosmosDB access to jumpbox only"
#   default     = false
# }

# variable "cosmosdb_ip_range_filter" {
#   type        = list(string)
#   description = "List of IP addresses to allow access to CosmosDB"
#   default     = []
# }

# # Function App Variables
# variable "function_app_blank_name" {
#   type        = string
#   description = "Base name for Function App resources"
#   default     = "funcapp"
# }

# variable "function_app_service_plan_id" {
#   type        = string
#   description = "ID of the App Service Plan for Function Apps"
#   default     = null
# }

# variable "function_app_storage_account_name" {
#   type        = string
#   description = "Storage account name for Function App backend"
#   default     = null
# }

# variable "function_app_storage_account_access_key" {
#   type        = string
#   description = "Access key for the storage account"
#   default     = null
#   sensitive   = true
# }

# variable "function_app_enable_network_integration" {
#   type        = bool
#   description = "Enable network integration for Function Apps"
#   default     = true
# }

# variable "function_app_identity_ids" {
#   type        = list(string)
#   description = "List of user-assigned managed identity IDs"
#   default     = null
# }

# variable "function_apps" {
#   type = map(object({
#     app_settings = optional(map(string), {})
#     site_config  = optional(map(string), {})
#   }))
#   description = "Configuration for Function Apps"
#   default     = {}
# }




# # Service Bus variables
# variable "servicebus_name" {
#   type        = string
#   description = "Name of the Service Bus namespace"
#   default     = "sb-demo"
# }

# variable "servicebus_private_dns_zone_id" {
#   type        = string
#   description = "ID of private DNS zone for Service Bus"
#   default     = null
# }

# variable "servicebus_capacity" {
#   type        = number
#   description = "Specifies the capacity of the Service Bus namespace"
#   default     = 1
# }

# variable "servicebus_ip_rules" {
#   type        = list(string)
#   description = "List of IP addresses or CIDR blocks that can access the Service Bus namespace"
#   default     = []
# }

# variable "servicebus_queues" {
#   type = map(object({
#     max_size_in_megabytes                = string
#     default_message_ttl                  = string
#     enable_partitioning                  = bool
#     dead_lettering_on_message_expiration = bool
#   }))
#   description = "Map of queues to create in the Service Bus namespace"
#   default     = {}
# }

# variable "servicebus_topics" {
#   type = map(object({
#     enable_partitioning = bool
#   }))
#   description = "Map of topics to create in the Service Bus namespace"
#   default     = {}
# }

# variable "servicebus_subscriptions" {
#   type = map(object({
#     forward_from_topic = string
#     forward_to_queue   = string
#     filters            = map(string)
#   }))
#   description = "Map of subscriptions to create for Service Bus topics"
#   default     = {}
# }

# variable "servicebus_authorization_rules" {
#   type = map(object({
#     send   = bool
#     listen = bool
#     manage = bool
#   }))
#   description = "Map of authorization rules for the Service Bus namespace"
#   default     = {}
# }

# variable "servicebus_api_connections" {
#   type        = map(any)
#   description = "Map of API connections to create for the Service Bus namespace"
#   default     = {}
# }

# # Storage Account variables
# variable "create_storage" {
#   type        = bool
#   description = "Flag to create a storage account or not"
#   default     = true
# }

# variable "storage_account_name" {
#   type        = string
#   description = "Name of the storage account"
# }

# variable "storage_account_kind" {
#   type        = string
#   description = "Defines the Kind of the storage account"
#   default     = "StorageV2"
# }

# variable "storage_account_tier" {
#   type        = string
#   description = "Defines the Tier to use for this storage account"
#   default     = "Standard"
# }

# variable "storage_account_replication_type" {
#   type        = string
#   description = "Defines the type of replication to use for this storage account"
#   default     = "GRS"
# }

# variable "storage_access_tier" {
#   type        = string
#   description = "Defines the access tier for this storage account"
#   default     = "Hot"
# }

# variable "storage_min_tls_version" {
#   type        = string
#   description = "The minimum supported TLS version for the storage account"
#   default     = "TLS1_2"
# }

# variable "storage_allow_nested_items_to_be_public" {
#   type        = bool
#   description = "Allow or disallow nested items within this Account to opt into being public"
#   default     = false
# }

# variable "storage_is_hns_enabled" {
#   type        = bool
#   description = "Is Hierarchical Namespace enabled? Required for Data Lake Storage Gen 2"
#   default     = false
# }

# variable "storage_nfsv3_enabled" {
#   type        = bool
#   description = "Is NFSv3 protocol enabled?"
#   default     = false
# }

# variable "storage_large_file_share_enabled" {
#   type        = bool
#   description = "Is Large File Share Enabled?"
#   default     = false
# }

# variable "storage_cross_tenant_replication_enabled" {
#   type        = bool
#   description = "Should cross Tenant replication be enabled?"
#   default     = false
# }

# variable "storage_container_delete_retention_policy_day" {
#   type        = number
#   description = "Number of days to retain deleted containers"
#   default     = 7
# }

# variable "storage_delete_retention_policy" {
#   type = object({
#     days = number
#   })
#   description = "Configuration for deleted blob retention policy"
#   default     = null
# }

# variable "storage_default_action" {
#   type        = string
#   description = "Specifies the default action of allow or deny when no other rules match"
#   default     = "Deny"
# }

# variable "storage_bypass" {
#   type        = list(string)
#   description = "Specifies whether traffic is bypassed for Logging/Metrics/AzureServices"
#   default     = ["AzureServices"]
# }

# variable "storage_ip_rules" {
#   type        = list(string)
#   description = "List of public IP or IP ranges in CIDR Format allowed to access the storage account"
#   default     = []
# }

# variable "storage_private_link_access" {
#   type        = any
#   description = "Map of resources to be granted access"
#   default     = {}
# }

# variable "storage_containers" {
#   type        = map(map(map(map(string))))
#   description = "Map of containers to create within the storage account"
#   default     = {}
# }

# variable "storage_data_lakes" {
#   type        = map(map(map(map(string))))
#   description = "Map of data lake filesystems to create within the storage account"
#   default     = {}
# }

# variable "storage_file_shares" {
#   type        = map(any)
#   description = "Map of file shares to create within the storage account"
#   default     = {}
# }

# variable "storage_queues" {
#   type        = map(any)
#   description = "Map of queues to create within the storage account"
#   default     = {}
# }

# variable "storage_create_lifecycle_policy" {
#   type        = bool
#   description = "Flag to create a lifecycle policy"
#   default     = false
# }

# variable "storage_lifecycle_policy" {
#   type = map(object({
#     name         = string
#     enabled      = bool
#     prefix_match = optional(list(string))
#     blob_types   = list(string)
#     actions = object({
#       base_blob = optional(object({
#         delete_after_days               = optional(number)
#         move_to_cold_after_modification = optional(number)
#       }))
#     })
#   }))
#   description = "Map of lifecycle policies to apply to the storage account"
#   default     = {}
# }

# Redis Cache variables
# variable "redis_name" {
#   type        = string
#   description = "Name of the Redis Cache instance"
# }

# variable "redis_sku_name" {
#   type        = string
#   description = "The SKU of Redis to use. Possible values are Basic, Standard, and Premium."
#   default     = "Standard"
# }

# variable "redis_family" {
#   type        = string
#   description = "The Redis family. Valid values: C (for Basic/Standard) or P (for Premium)."
#   default     = "C"
# }

# variable "redis_capacity" {
#   type        = number
#   description = "The size of the Redis cache. Valid values: for C family (0, 1, 2, 3, 4, 5, 6), for P family (1, 2, 3, 4, 5)"
#   default     = 1
# }

# variable "redis_enable_non_ssl_port" {
#   type        = bool
#   description = "Enable the non-SSL port (6379) for Redis access"
#   default     = false
# }

# variable "redis_minimum_tls_version" {
#   type        = string
#   description = "The minimum TLS version for the Redis cache. Possible values are 1.0, 1.1, and 1.2"
#   default     = "1.2"
# }

# variable "redis_maxmemory_reserved" {
#   type        = number
#   description = "The amount of memory in MB reserved for non-cache usage, e.g., failover"
#   default     = 50
# }

# variable "redis_maxmemory_delta" {
#   type        = number
#   description = "The max-memory delta for Redis"
#   default     = 50
# }

# variable "redis_maxmemory_policy" {
#   type        = string
#   description = "The max memory policy of Redis. Possible values: volatile-lru, allkeys-lru, volatile-random, allkeys-random, volatile-ttl, noeviction"
#   default     = "volatile-lru"
# }

# variable "redis_create_private_endpoint" {
#   type        = bool
#   description = "Whether to create a private endpoint for the Redis cache"
#   default     = false
# }

# variable "redis_private_dns_zone_id" {
#   type        = string
#   description = "The ID of the private DNS zone for Redis private endpoints"
#   default     = null
# }

# variable "redis_log_analytics_workspace_id" {
#   type        = string
#   description = "The ID of the Log Analytics Workspace to send diagnostics to"
#   default     = null
# }

# variable "redis_diagnostic_retention_days" {
#   type        = number
#   description = "The number of days to retain diagnostics logs"
#   default     = 30
# }


# variable "redis_name" {
#   type        = string
#   description = "Name of the Redis Cache"
# }

# variable "redis_sku_name" {
#   type        = string
#   description = "The SKU of Redis to use. Possible values are Basic, Standard and Premium."
# }

# variable "redis_family" {
#   type        = string
#   description = "The SKU family/pricing group to use. Valid values are C (for Basic/Standard SKU) and P (for Premium)"
# }

# variable "redis_capacity" {
#   type        = number
#   description = "The size of the Redis cache to deploy. Valid values for a SKU family of C (Basic/Standard) are 0, 1, 2, 3, 4, 5, 6, and for P (Premium) family are 1, 2, 3, 4, 5"
# }

# variable "redis_enable_non_ssl_port" {
#   type        = bool
#   description = "Enable the non-SSL port (6379)"
#   default     = false
# }

# variable "redis_minimum_tls_version" {
#   type        = string
#   description = "The minimum TLS version. Possible values are 1.0, 1.1, 1.2"
#   default     = "1.2"
# }

# variable "redis_public_network_access" {
#   type        = string
#   description = "Whether or not public network access is allowed for this Redis Cache. Possible values are Enabled and Disabled."
#   default     = "Disabled"
# }

# variable "redis_maxmemory_reserved" {
#   type        = string
#   description = "The amount of memory in MB that is reserved for non-cache operations"
#   default     = "125"
# }

# variable "redis_maxmemory_delta" {
#   type        = string
#   description = "The amount of memory in MB to reserve for hash indexes"
#   default     = "125"
# }

# variable "redis_maxfragmentation_reserved" {
#   type        = string
#   description = "The amount of memory in MB that should be reserved for fragmentation"
#   default     = "125"
# }

# variable "create_private_endpoint" {
#   type        = bool
#   description = "Whether to create a private endpoint for the Redis Cache"
#   default     = true
# }

# variable "private_endpoint_name" {
#   type        = string
#   description = "Name of the private endpoint resource"
#   default     = null
# }

# variable "subnet_id" {
#   type        = string
#   description = "ID of the subnet where the private endpoint will be created"
#   default     = null
# }

# variable "private_dns_zone_id" {
#   type        = string
#   description = "ID of the private DNS zone for privatelink.redis.cache.windows.net"
#   default     = null
# }

# # Add this to prevent prompts during terraform operations
# variable "postgresql_server_name" {
#   type        = string
#   description = "Name of the PostgreSQL flexible server"
#   default     = "not-used-placeholder"
# }

# variable "resource_group_name" {
#   type        = string
#   description = "Name of the resource group where resources will be created"
# }

# variable "location" {
#   type        = string
#   description = "Azure region where resources will be deployed"
# }

# variable "tags" {
#   type        = map(string)
#   description = "Tags to apply to all resources"
#   default     = {}
# }

# variable "redis_instances" {
#   description = "Map of Redis instances to create"
#   type = map(object({
#     name                        = string
#     sku_name                    = optional(string)
#     family                      = optional(string)
#     capacity                    = optional(number)
#     enable_non_ssl_port         = optional(bool)
#     minimum_tls_version         = optional(string)
#     public_network_access       = optional(string)
#     maxmemory_reserved          = optional(string)
#     maxmemory_delta             = optional(string)
#     maxfragmentation_reserved   = optional(string)
#     create_private_endpoint     = optional(bool)
#     private_endpoint_name       = optional(string)
#     subnet_id                   = optional(string)
#     private_dns_zone_id         = optional(string)
#   }))
# }

#azure key vault variables
# variable "key_vaults" {
#   description = "Map of Key Vaults to create"
#   type = map(object({
#     name                        = string
#     sku_name                    = optional(string, "standard")
#     soft_delete_retention_days  = optional(number, 90)
#     purge_protection_enabled    = optional(bool, false)
#     enabled_for_disk_encryption = optional(bool, false)
#     enabled_for_deployment      = optional(bool, false)
#     enabled_for_template_deployment = optional(bool, false)
#     enable_rbac_authorization   = optional(bool, false)
#     public_network_access_enabled = optional(bool, true)
#     network_acls = optional(object({
#       bypass                     = string
#       default_action             = string
#       ip_rules                   = list(string)
#       virtual_network_subnet_ids = list(string)
#     }))
#     access_policies = optional(map(object({
#       object_id               = string
#       key_permissions         = optional(list(string), [])
#       secret_permissions      = optional(list(string), [])
#       certificate_permissions = optional(list(string), [])
#       storage_permissions     = optional(list(string), [])
#     })), {})
#     tags = optional(map(string), {})
#   }))
# }

variable "key_vaults" {
  description = "Map of Key Vaults to create"
  type = map(object({
    name                        = string
    sku_name                    = optional(string, "standard")
    soft_delete_retention_days  = optional(number, 90)
    purge_protection_enabled    = optional(bool, false)
    enabled_for_disk_encryption = optional(bool, true)
    enabled_for_deployment      = optional(bool, true)
    enabled_for_template_deployment = optional(bool, true)
    enable_rbac_authorization   = optional(bool, false)
    public_network_access_enabled = optional(bool, true)
    network_acls = optional(object({
      bypass                     = string
      default_action             = string
      ip_rules                   = list(string)
      virtual_network_subnet_ids = list(string)
    }))
    access_policies = optional(map(object({
      object_id               = string
      key_permissions         = optional(list(string), [])
      secret_permissions      = optional(list(string), [])
      certificate_permissions = optional(list(string), [])
      storage_permissions     = optional(list(string), [])
    })), {})
    # Private endpoint properties
    create_private_endpoint     = optional(bool, false)
    private_endpoint_name       = optional(string)
    subnet_id                   = optional(string)
    subnet_name                 = optional(string)
    vnet_key                    = optional(string)
    private_dns_zone_ids        = optional(list(string))
    vnet_id                     = optional(string)
    tags                        = optional(map(string), {})
  }))
  default = {}
}

#redis variables
# variable "redis_instances" {
#   description = "Map of Redis instances to create"
#   type = map(object({
#     name                       = string
#     sku_name                   = string
#     family                     = string
#     capacity                   = number
#     enable_non_ssl_port        = bool
#     minimum_tls_version        = string
#     public_network_access      = string
#     maxmemory_reserved         = string
#     maxmemory_delta            = string
#     maxfragmentation_reserved  = string
#     create_private_endpoint    = bool
#     private_endpoint_name      = string
#     subnet_id                  = string
#     private_dns_zone_id        = string
#   }))
# }

variable "redis_instances" {
  description = "Map of Redis instances to create"
  type = map(object({
    name                            = string
    resource_group_name             = optional(string)
    location                        = optional(string)
    sku_name                        = optional(string, "Basic")
    family                          = optional(string, "C")
    capacity                        = optional(number, 0)
    enable_non_ssl_port             = optional(bool, false)
    minimum_tls_version             = optional(string, "1.2")
    public_network_access_enabled   = optional(bool, true)
    maxmemory_reserved              = optional(string, "30")
    maxmemory_delta                 = optional(string, "30")
    maxfragmentationmemory_reserved = optional(string, "30")
    create_private_endpoint         = optional(bool, true)
    private_endpoint_name           = optional(string)
    subnet_id                       = optional(string)
    subnet_name                     = optional(string)
    vnet_key                        = optional(string)
    private_dns_zone_ids            = optional(list(string))
    tags                            = optional(map(string), {})
  }))
  default = {}
}


# Add this to prevent prompts during terraform operations
variable "postgresql_server_name" {
  type        = string
  description = "Name of the PostgreSQL flexible server"
  default     = "not-used-placeholder"
}

#cosmosdb variable
variable "cosmosdb_mongo_clusters" {
  description = "Map of CosmosDB MongoDB clusters to create"
  type = map(object({
    name                         = string
    administrator_login          = optional(string, "mongoadmin")
    administrator_login_password = string
    server_version               = optional(string, "7.0")
    node_group_name              = optional(string, "")
    node_group_sku               = optional(string, "M10")
    disk_size_gb                 = optional(number, 32)
    enable_ha                    = optional(bool, false)
    node_count                   = optional(number, 1)
    public_network_access        = optional(string, "Enabled")
    create_private_endpoint      = optional(bool, true)
    private_endpoint_name        = optional(string)
    subnet_id                    = optional(string)
    subnet_name                  = optional(string)
    vnet_key                     = optional(string, "vnet1")
    private_dns_zone_id          = optional(string)
    prevent_deployment           = optional(bool, false)
    tags                         = optional(map(string), {})
  }))
  default = {}
}

#servicebus variable
# variable "servicebus_namespaces" {
#   description = "Map of Service Bus namespaces to create"
#   type = map(object({
#     name                   = string
#     resource_group_name    = optional(string)
#     location               = optional(string)
#     sku                   = optional(string, "Standard")
#     zone_redundant        = optional(bool, true)
#     disable_local_auth    = optional(bool, false)
#     create_private_endpoint = optional(bool, true)
#     private_endpoint_name  = optional(string)
#     subnet_id              = optional(string)
#     subnet_name            = optional(string)
#     vnet_key               = optional(string)
#     private_dns_zone_ids   = optional(list(string))
#     topics                 = optional(map(object({
#       max_size_in_megabytes    = optional(number, 1024)
#       enable_partitioning      = optional(bool, false)
      
#       subscriptions = optional(map(object({
#         max_delivery_count = optional(number, 10)
#         lock_duration      = optional(string, "PT1M")
#         requires_session   = optional(bool, false)
#         auto_delete_on_idle = optional(string, "P10D")
#       })), {})
#     })), null)
#     tags                   = optional(map(string), {})
#   }))
#   default = {}
# }

# servicebus variable
variable "servicebus_namespaces" {
  description = "Map of Service Bus namespaces to create"
  type = map(object({
    name                   = string
    resource_group_name    = optional(string)
    location               = optional(string)
    sku                   = optional(string, "Standard")
    zone_redundant        = optional(bool, true)
    disable_local_auth    = optional(bool, false)
    create_private_endpoint = optional(bool, true)
    private_endpoint_name  = optional(string)
    subnet_id              = optional(string)
    subnet_name            = optional(string)
    vnet_key               = optional(string)
    private_dns_zone_ids   = optional(list(string))
    topics                 = optional(map(object({
      max_size_in_megabytes    = optional(number, 1024)
      default_message_ttl      = optional(string, "PT1H")
      enable_partitioning      = optional(bool, false)
      support_ordering         = optional(bool, true)
      duplicate_detection_history_time_window = optional(string, null)
      status                   = optional(string, "Active")
      auto_delete_on_idle      = optional(string, null)
      
      subscriptions = optional(map(object({
        max_delivery_count                   = optional(number, 100)
        lock_duration                        = optional(string, "PT1M")
        default_message_ttl                  = optional(string, "PT10M")
        auto_delete_on_idle                  = optional(string, "P31D")
        requires_session                     = optional(bool, false)
        dead_lettering_on_message_expiration = optional(bool, false)
        forward_to                           = optional(string, null)
        forward_dead_lettered_messages_to    = optional(string, null)
        enable_batched_operations            = optional(bool, true)
      })), {})
    })), null)
    tags                   = optional(map(string), {})
  }))
  default = {}
}


# variable "servicebus_namespaces" {
#   description = "Map of Service Bus namespaces to create"
#   type = map(object({
#     name                   = string
#     sku                    = optional(string, "Basic")
#     capacity               = optional(number, 0)
#     zone_redundant         = optional(bool, true)
#     create_private_endpoint = optional(bool, false)
#     private_endpoint_name  = optional(string)
#     subnet_id              = optional(string)
#     subnet_name            = optional(string)
#     vnet_key               = optional(string)
#     private_dns_zone_id    = optional(string)
#     tags                   = optional(map(string))
#   }))
#   default = {}
# }

#storage account

variable "storage_accounts" {
  description = "Map of Storage Accounts to create"
  type = map(object({
    name                          = string
    account_tier                  = optional(string, "Standard")
    account_replication_type      = optional(string, "LRS")
    account_kind                  = optional(string, "StorageV2")
    access_tier                   = optional(string, "Hot")
    enable_https_traffic_only     = optional(bool, true)
    min_tls_version               = optional(string, "TLS1_2")
    is_hns_enabled                = optional(bool, false)
    nfsv3_enabled                 = optional(bool, false)
    shared_access_key_enabled     = optional(bool, true)
    public_network_access_enabled = optional(bool, false)
    large_file_share_enabled      = optional(bool, true)
    cross_tenant_replication_enabled = optional(bool, false)
    network_default_action        = optional(string, "Deny")
    ip_rules                      = optional(list(string), [])
    virtual_network_subnet_ids    = optional(list(string), [])
    network_bypass                = optional(list(string), ["AzureServices"])
    create_private_endpoint       = optional(bool, true)
    private_endpoint_name         = optional(string)
    subnet_id                     = optional(string)
    subnet_name                   = optional(string)
    vnet_key                      = optional(string)
    private_endpoint_subresources = optional(list(string), ["blob"])
    private_dns_zone_ids          = optional(list(string))
    containers                    = optional(list(object({
      name                  = string
      container_access_type = optional(string, "private")
      metadata              = optional(map(string), {})
    })), [])
    tags                          = optional(map(string), {})
  }))
  default = {}
}

# variable "storage_accounts" {
#   description = "Map of Storage Accounts to create"
#   type = map(object({
#     name                          = string
#     account_tier                  = optional(string, "Standard")
#     account_replication_type      = optional(string, "LRS")
#     account_kind                  = optional(string, "StorageV2")
#     access_tier                   = optional(string, "Hot")
#     enable_https_traffic_only     = optional(bool, true)
#     min_tls_version               = optional(string, "TLS1_2")
#     is_hns_enabled                = optional(bool, false)
#     nfsv3_enabled                 = optional(bool, false)
#     shared_access_key_enabled     = optional(bool, true)
#     public_network_access_enabled = optional(bool, false)
#     large_file_share_enabled      = optional(bool, true)
#     cross_tenant_replication_enabled = optional(bool, false)
#     network_default_action        = optional(string, "Deny")
#     ip_rules                      = optional(list(string), [])
#     virtual_network_subnet_ids    = optional(list(string), [])
#     network_bypass                = optional(list(string), ["AzureServices"])
#     create_private_endpoint       = optional(bool, true)
#     private_endpoint_name         = optional(string)
#     subnet_id                     = optional(string)
#     subnet_name                   = optional(string)
#     vnet_key                      = optional(string)
#     private_endpoint_subresources = optional(list(string), ["blob"])
#     private_dns_zone_ids          = optional(list(string))
#     tags                          = optional(map(string), {})
#   }))
#   default = {}
# }

#aks variables

# variable "aks" {
#   description = "Map of AKS clusters to create"
#   type = map(object({
#     name                = string
#     dns_prefix          = string
#     kubernetes_version  = optional(string, "1.30.10")
#     node_resource_group = optional(string)
    
#     default_node_pool = object({
#       name            = string
#       vm_size         = string
#       min_count       = optional(number, 1)
#       max_count       = optional(number, 4)
#       node_count      = optional(number, 2)
#       os_disk_size_gb = optional(number, 220)
#     })
    
#     vnet_key    = string
#     subnet_name = string
    
#     log_analytics_workspace_id = string
#   }))
#   default = {}
# }

# variable "tenant_id" {
#   description = "The Azure AD tenant ID"
#   type        = string
#   default     = "fac6c768-4c4f-4392-b8df-0a9ff482f100"
# }

# variable "aks" {
#   description = "Map of AKS clusters to create"
#   type = map(object({
#     name                = string
#     dns_prefix          = string
#     kubernetes_version  = optional(string, "1.30.10")
#     node_resource_group = optional(string)
    
#     default_node_pool = object({
#       name            = string
#       vm_size         = string
#       min_count       = optional(number, 1)
#       max_count       = optional(number, 4)
#       node_count      = optional(number, 2)
#       os_disk_size_gb = optional(number, 220)
#     })
    
#     vnet_key    = string
#     subnet_name = string
    
#     log_analytics_workspace_id = optional(string)  # Make this optional
#   }))
#   default = {}
# }

# variable "tenant_id" {
#   description = "The Azure AD tenant ID"
#   type        = string
#   default     = "fac6c768-4c4f-4392-b8df-0a9ff482f100"
# }


# Virtual Network Lookup Configuration
variable "virtual_networks" {
  description = "Map of Virtual Networks for subnet lookups"
  type = map(object({
    resource_group_name = string
    name                = string
    subnets = map(object({
      name = string
      id   = string
    }))
  }))
  default = {}
}

# Default subnet ID if lookup fails
variable "default_subnet_id" {
  description = "Default subnet ID to use if subnet lookup fails"
  type        = string
  default     = null
}

# Log Analytics Configuration
variable "log_analytics_workspace_id" {
  description = "Resource ID of the Log Analytics workspace to use with AKS clusters"
  type        = string
  default     = null
}

# AKS Cluster Configuration Variable
variable "aks" {
  description = "Map of AKS clusters to create"
  type = map(object({
    name                = string
    dns_prefix          = string
    kubernetes_version  = string
    sku_tier            = string

    default_node_pool = object({
      name            = string
      vm_size         = string
      node_count      = number
      min_count       = number
      max_count       = number
      os_disk_size_gb = number
    })

    # Add full subnet configuration
    subnet = optional(object({
      id           = optional(string)
      name         = optional(string, "default")
      vnet_name    = optional(string)
      vnet_key     = optional(string)
      address_prefix = optional(string)
    }), {})

    # Flexible subnet identification
    vnet_key      = optional(string)
    subnet_name   = optional(string)
    subnet_id     = optional(string)

    # Log Analytics options
    use_existing_log_analytics = optional(bool, false)
    log_analytics_workspace_id = optional(string)

    # Optional configurations
    network_plugin        = optional(string, "azure")
    network_policy        = optional(string, "azure")
    aci_connector_enabled = optional(bool, false)
    aci_connector_subnet  = optional(string)
    
    ##new thing
    # ACR Integration - new parameters with name support
    attach_acr               = optional(bool, false)
    acr_name                 = optional(string)
    acr_resource_group_name  = optional(string)
    acr_subscription_id      = optional(string)
    acr_id                   = optional(string) # Takes precedence if specified

    # Advanced configurations
    auto_upgrade_profile = optional(object({
      upgrade_channel = optional(string, "stable")
      schedule        = optional(string)
    }), {})
    
    security_profile = optional(object({
      node_security_channel       = optional(string)
      security_channel_schedule   = optional(string)
    }), {})
    
    authentication = optional(object({
      enable_azure_rbac      = optional(bool, true)
      disable_local_accounts = optional(bool, true)
    }), {})


    tags = map(string)
  }))
}

# openai variables
variable "openai_accounts" {
  description = "Map of OpenAI accounts to create"
  type = map(object({
    name                          = string
    sku_name                      = optional(string, "S0")
    custom_subdomain_name         = optional(string)
    public_network_access_enabled = optional(bool, false)
    network_default_action        = optional(string, "Deny")
    ip_rules                      = optional(list(string), [])
    virtual_network_subnet_ids    = optional(list(string), [])
    create_private_endpoint       = optional(bool, true)
    private_endpoint_name         = optional(string)
    subnet_id                     = optional(string)
    subnet_name                   = optional(string)
    vnet_key                      = optional(string)
    private_dns_zone_ids          = optional(list(string))
    model_deployments             = optional(list(object({
      name           = string
      model_name     = string
      model_version  = string
      scale_capacity = number
    })), [])
    tags                          = optional(map(string), {})
  }))
  default = {}
}


#postgresql variables




variable "postgresql_servers" {
  description = "Map of PostgreSQL Flexible Servers to create"
  type = map(object({
    name                = string
    resource_group_name = optional(string)
    location            = optional(string)
    
    # Authentication settings
    administrator_login    = string
    administrator_password = string
    postgres_version       = optional(string, "15")
    
    # Compute and storage settings
    sku_name                 = optional(string, "B_Standard_B1ms")
    storage_size_gb          = optional(number, 32)
    storage_auto_grow_enabled = optional(bool, true)
    availability_zone        = optional(string, "2")
    
    # Backup settings
    backup_retention_days    = optional(number, 7)
    geo_redundant_backup     = optional(bool, false)
    
    # Authentication settings
    active_directory_auth_enabled = optional(bool, false)
    password_auth_enabled         = optional(bool, true)
    
    allow_azure_services = optional(bool, true)

    # Maintenance window settings
    maintenance_window_enabled      = optional(bool, false)
    maintenance_window_day_of_week  = optional(number, 0)
    maintenance_window_start_hour   = optional(number, 0)
    maintenance_window_start_minute = optional(number, 0)
    
    # Databases and firewall rules
    databases = optional(list(object({
      name      = string
      charset   = optional(string, "UTF8")
      collation = optional(string, "en_US.utf8")
    })), [])
    
    firewall_rules = optional(list(object({
      name             = string
      start_ip_address = string
      end_ip_address   = string
    })), [])
    
    tags = optional(map(string), {})
  }))
  default = {}
}


# #synapse variables

# # SQL Admin Credentials
# variable "sql_admin_username" {
#   type        = string
#   description = "SQL Administrator Username"
#   sensitive   = true
# }

# variable "sql_admin_password" {
#   type        = string
#   description = "SQL Administrator Password"
#   sensitive   = true
# }

# # Synapse Workspaces Configuration
# variable "synapse_workspaces" {
#   description = "Map of Synapse Workspaces to create"
#   type = map(object({
#     name                              = string
#     storage_account_name               = string
    
#     # Optional Storage Configuration
#     filesystem_name                    = optional(string)
#     storage_account_tier               = optional(string)
#     storage_account_replication_type   = optional(string)
#     storage_account_kind               = optional(string)
#     storage_is_hns_enabled             = optional(bool)

#     # Network and Authentication
#     public_network_access_enabled      = optional(bool)
#     azuread_only_authentication        = optional(bool)
#     identity_type                      = optional(string)

#     # Private Endpoint
#     enable_private_endpoint             = optional(bool)
#     private_endpoint_subnet_id          = optional(string)

#     # Firewall Rules
#     synapse_firewall_rules              = optional(map(object({
#       start_ip_address = string
#       end_ip_address   = string
#     })), {})

#     # Tags
#     tags                                = optional(map(string))
#   }))
#   default = {}
# }


#service-connection variables
variable "aks_cluster_name" {
  description = "The name of the AKS cluster"
  type        = string
}

variable "storage_blob_connections" {
  description = "List of storage blob connections to create"
  type = list(object({
    name                 = string
    resource_group       = optional(string)
    target_resource_group = optional(string)
    account              = string
    connection           = string
    workload_identity    = string
    client_type          = optional(string)
    client_version       = optional(string)
    namespace            = optional(string)
    role                 = optional(string)
    additional_parameters = optional(map(string))
  }))
  default = []
}

variable "service_bus_connections" {
  description = "List of service bus connections to create"
  type = list(object({
    name                 = string
    resource_group       = optional(string)
    target_resource_group = optional(string)
    namespace            = string
    connection           = string
    workload_identity    = string
    client_type          = optional(string)
    client_version       = optional(string)
    k8s_namespace        = optional(string)
    role                 = optional(string)
    additional_parameters = optional(map(string))
  }))
  default = []
}

variable "keyvault_connections" {
  description = "List of Key Vault connections to create"
  type = list(object({
    name                 = string
    resource_group       = optional(string)
    target_resource_group = optional(string)
    vault                = string
    connection           = string
    workload_identity    = string
    client_type          = optional(string)
    client_version       = optional(string)
    k8s_namespace        = optional(string)
    role                 = optional(string)
    enable_csi           = optional(bool, false)
    additional_parameters = optional(map(string))
  }))
  default = []
}



#managed-identity variables

variable "managed_identities" {
  description = "Map of managed identities to create"
  type = map(object({
    name                = string
    assign_storage_role = optional(bool, false)
    role_assignments    = optional(map(object({
      scope                = string
      role_definition_name = string
    })), {})
    tags                = optional(map(string), {})
  }))
  default = {}
}
