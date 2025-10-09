terraform {
  backend "azurerm" {
    # The specific configuration will be loaded from backend.config
    # No need to specify parameters here
  }
}

# Get current Azure client configuration
data "azurerm_client_config" "current" {}

# resource "azurerm_resource_group" "rg" {
#   name     = var.resource_group_name
#   location = var.location
#   tags     = var.tags
# }

############
### VNET ###
############

module "vnet" {
  source   = "./vnet"
  for_each = var.vnets

  resource_group_name = var.resource_group_name
  location            = var.location
  vnet_name           = each.value.name
  address_space       = each.value.address_space
  subnets             = each.value.subnets
  peerings            = lookup(each.value, "peerings", {})
  tags                = merge(var.tags, lookup(each.value, "tags", {}))
}


# ###########
# ### ACR ###
# ###########

# ACR Module
module "acr" {
  source   = "./acr"
  for_each = var.container_registries

  resource_group_name     = var.resource_group_name
  location                = var.location
  name                    = each.value.name
  sku                     = each.value.sku
  admin_enabled           = lookup(each.value, "admin_enabled", true)
  retention_policy_days   = lookup(each.value, "retention_policy_days", 7)
  retention_policy_enabled = lookup(each.value, "retention_policy_enabled", false)
  trust_policy_enabled    = lookup(each.value, "trust_policy_enabled", false)
  tags                    = merge(var.tags, lookup(each.value, "tags", {}))
}



# KeyVault Module
module "keyvault" {
  source   = "./akv"
  for_each = var.key_vaults

  resource_group_name         = var.resource_group_name
  location                    = var.location
  name                        = each.value.name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sku_name                    = lookup(each.value, "sku_name", "standard")
  soft_delete_retention_days  = lookup(each.value, "soft_delete_retention_days", 90)
  purge_protection_enabled    = lookup(each.value, "purge_protection_enabled", false)
  enabled_for_disk_encryption = lookup(each.value, "enabled_for_disk_encryption", false)
  enabled_for_deployment      = lookup(each.value, "enabled_for_deployment", false)
  enabled_for_template_deployment = lookup(each.value, "enabled_for_template_deployment", false)
  enable_rbac_authorization   = lookup(each.value, "enable_rbac_authorization", false)
  public_network_access_enabled = lookup(each.value, "public_network_access_enabled", true)
  network_acls                = lookup(each.value, "network_acls", null)
  
  # Private endpoint configuration
  create_private_endpoint     = lookup(each.value, "create_private_endpoint", false)
  private_endpoint_name       = lookup(each.value, "private_endpoint_name", null)
  subnet_id = try(
    module.vnet[lookup(each.value, "vnet_key", "vnet1")].subnet_ids[lookup(each.value, "subnet_name", "")],
    lookup(each.value, "subnet_id", null)
  )
  vnet_id = try(
    module.vnet[lookup(each.value, "vnet_key", "vnet1")].vnet_id,
    lookup(each.value, "vnet_id", null)
  )
  private_dns_zone_ids        = lookup(each.value, "private_dns_zone_ids", null)
  
  # Process access policies, replacing special value "current_user" with actual object_id
  access_policies = {
    for k, v in lookup(each.value, "access_policies", {}) : k => {
      object_id = v.object_id == "current_user" ? data.azurerm_client_config.current.object_id : v.object_id
      key_permissions = lookup(v, "key_permissions", [])
      secret_permissions = lookup(v, "secret_permissions", [])
      certificate_permissions = lookup(v, "certificate_permissions", [])
      storage_permissions = lookup(v, "storage_permissions", [])
    }
  }
  
  tags = merge(var.tags, lookup(each.value, "tags", {}))
}


# AKS Module
module "aks" {
  source = "./aks"
  depends_on = [module.vnet] # Explicitly depend on the VNET module

  for_each = var.aks
  
  # Pass subscription ID
  subscription_id = data.azurerm_subscription.current.subscription_id

  # Get the subnet ID dynamically
  vnet_subnet_id = lookup(each.value, "subnet_id", null) != null ? each.value.subnet_id : (
    lookup(each.value, "vnet_key", null) != null && lookup(each.value, "subnet_name", null) != null ? (
      module.vnet[lookup(each.value, "vnet_key", "")].subnet_ids[lookup(each.value, "subnet_name", "")]
    ) : null
  )

  # Location and Resource Group
  location            = var.location  #data.azurerm_resource_group.existing.location
  resource_group_name = var.resource_group_name #data.azurerm_resource_group.existing.name
  
  # Cluster Configuration - pass kubernetes_version from tfvars
  cluster_name        = each.value.name
  prefix              = each.value.dns_prefix
  kubernetes_version  = each.value.kubernetes_version
  sku_tier            = each.value.sku_tier

  # Log Analytics settings from screenshot 2
  log_analytics_workspace_enabled = true
  log_analytics_workspace_name    = lookup(each.value, "log_analytics_workspace_name", "techous-d-dea-sqlmi-logworkspace")
  existing_log_analytics_resource_id = try(
    each.value.log_analytics_workspace_id, 
    var.log_analytics_workspace_id, 
    null
  )

  # Node Pool Configuration
  agents_pool_name    = lookup(each.value.default_node_pool, "name", "nodepool")
  agents_size         = each.value.default_node_pool.vm_size
  agents_count        = each.value.default_node_pool.node_count
  enable_auto_scaling = true
  agents_min_count    = each.value.default_node_pool.min_count
  agents_max_count    = each.value.default_node_pool.max_count
  os_disk_size_gb     = each.value.default_node_pool.os_disk_size_gb

  # Networking Configuration as shown in screenshot 1
  network_plugin      = lookup(each.value, "network_plugin", "azure")
  network_plugin_mode = lookup(each.value, "network_plugin_mode", null)
  # Network policy is intentionally not set for Azure CNI with migration option

  # ACI Connector
  aci_connector_linux_enabled     = lookup(each.value, "aci_connector_enabled", false)
  aci_connector_linux_subnet_name = lookup(each.value, "aci_connector_subnet", null)

  # Identity and Tags
  identity_type = "SystemAssigned"
  tags          = lookup(each.value, "tags", {})

  ##new thing
  # ACR Integration - New parameters with name support
  attach_acr             = lookup(each.value, "attach_acr", false)
  acr_name               = lookup(each.value, "acr_name", null)
  acr_resource_group_name = lookup(each.value, "acr_resource_group_name", null)
  acr_subscription_id    = lookup(each.value, "acr_subscription_id", null)
  acr_id                 = lookup(each.value, "acr_id", null)
}

# Outputs
output "aks_clusters" {
  value = {
    for k, v in module.aks : k => {
      name     = v.aks_name
      id       = v.aks_id
      location = v.location
    }
  }
}

output "aks_kubeconfigs" {
  value     = { for k, v in module.aks : k => v.kube_config_raw }
  sensitive = true
}



// # ###########################
// # ### service-connector ###
// # ###########################
locals {
  # Process and normalize connections with default values
  connections = concat(
    # Convert storage blob connections to the generic format
    [for conn in var.storage_blob_connections : {
      name                 = conn.name
      connection_type      = "storage-blob"
      resource_group       = coalesce(lookup(conn, "resource_group", null), var.resource_group_name)
      target_resource_group = coalesce(lookup(conn, "target_resource_group", null), lookup(conn, "resource_group", null), var.resource_group_name)
      storage_account_name = conn.account
      service_bus_namespace = ""
      keyvault_name        = ""
      connection_name      = conn.connection
      workload_identity    = conn.workload_identity
      client_type          = lookup(conn, "client_type", "None")
      client_version       = lookup(conn, "client_version", "")
      namespace            = lookup(conn, "namespace", "default")
      role                 = lookup(conn, "role", "")
      enable_csi           = false
      additional_parameters = lookup(conn, "additional_parameters", {})
    }],
    # Convert service bus connections to the generic format
    [for conn in var.service_bus_connections : {
      name                 = conn.name
      connection_type      = "service-bus"
      resource_group       = coalesce(lookup(conn, "resource_group", null), var.resource_group_name)
      target_resource_group = coalesce(lookup(conn, "target_resource_group", null), lookup(conn, "resource_group", null), var.resource_group_name)
      storage_account_name = ""
      service_bus_namespace = conn.namespace
      keyvault_name        = ""
      connection_name      = conn.connection
      workload_identity    = conn.workload_identity
      client_type          = lookup(conn, "client_type", "None")
      client_version       = lookup(conn, "client_version", "")
      namespace            = lookup(conn, "k8s_namespace", "default")
      role                 = lookup(conn, "role", "")
      enable_csi           = false
      additional_parameters = lookup(conn, "additional_parameters", {})
    }],
    # Convert key vault connections to the generic format
    [for conn in var.keyvault_connections : {
      name                 = conn.name
      connection_type      = "keyvault"
      resource_group       = coalesce(lookup(conn, "resource_group", null), var.resource_group_name)
      target_resource_group = coalesce(lookup(conn, "target_resource_group", null), lookup(conn, "resource_group", null), var.resource_group_name)
      storage_account_name = ""
      service_bus_namespace = ""
      keyvault_name        = conn.vault
      connection_name      = conn.connection
      workload_identity    = conn.workload_identity
      client_type          = lookup(conn, "client_type", "None")
      client_version       = lookup(conn, "client_version", "")
      namespace            = lookup(conn, "k8s_namespace", "default")
      role                 = lookup(conn, "role", "")
      enable_csi           = lookup(conn, "enable_csi", false)
      additional_parameters = lookup(conn, "additional_parameters", {})
    }]
  )
}

module "service_connection" {
  source = "./service-connector"
  
  for_each = { for conn in local.connections : conn.name => conn }
  
  subscription_id      = var.subscription_id
  connection_type      = each.value.connection_type
  resource_group       = each.value.resource_group
  aks_name             = var.aks_cluster_name
  target_resource_group = each.value.target_resource_group
  storage_account_name = each.value.storage_account_name
  service_bus_namespace = each.value.service_bus_namespace
  keyvault_name        = each.value.keyvault_name
  connection_name      = each.value.connection_name
  workload_identity    = each.value.workload_identity
  client_type          = each.value.client_type
  client_version       = each.value.client_version
  namespace            = each.value.namespace
  role                 = each.value.role
  enable_csi           = each.value.enable_csi
  additional_parameters = each.value.additional_parameters
}


# #######################
# ### managed_identities ###
# #######################

# Simplest implementation - just create the managed identity
module "managed_identities" {
  source   = "./managed_identity"
  for_each = var.managed_identities

  name                = each.value.name
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = merge(var.tags, lookup(each.value, "tags", {}))
  
  # Leave role assignments empty for now
  role_assignments    = {}
}

# ################
# ### COSMO DB ###
# ################
module "cosmosdb_mongo" {
  source   = "./cosmosdb_mongo"
  for_each = var.cosmosdb_mongo_clusters

  resource_group_name          = var.resource_group_name
  location                     = var.location
  name                         = each.value.name
  administrator_login          = lookup(each.value, "administrator_login", "mongoadmin")
  administrator_login_password = each.value.administrator_login_password
  server_version               = lookup(each.value, "server_version", "7.0")
  
  # This is where the error is happening - let's fix it
  node_group_specs = [
    {
      name         = lookup(each.value, "node_group_name", "")
      kind         = "shard"  # Lowercase to avoid validation errors
      sku          = lookup(each.value, "node_group_sku", "M10")
      disk_size_gb = lookup(each.value, "disk_size_gb", 32)
      enable_ha    = lookup(each.value, "enable_ha", false)
      node_count   = lookup(each.value, "node_count", 1)
    }
  ]
  
  public_network_access   = lookup(each.value, "public_network_access", "Enabled")
  create_private_endpoint = lookup(each.value, "create_private_endpoint", true)
  private_endpoint_name   = lookup(each.value, "private_endpoint_name", null)
  
  # Fixed ternary expression for subnet_id
  subnet_id = lookup(each.value, "subnet_name", null) != null ? (
    module.vnet[lookup(each.value, "vnet_key", "vnet1")].subnet_ids[each.value.subnet_name]
  ) : lookup(each.value, "subnet_id", null)
  
  vnet_id            = module.vnet[lookup(each.value, "vnet_key", "vnet1")].vnet_id
  private_dns_zone_id = lookup(each.value, "private_dns_zone_id", null)
  vnet_key           = lookup(each.value, "vnet_key", "vnet1")
  prevent_deployment = lookup(each.value, "prevent_deployment", false)
  tags               = merge(var.tags, lookup(each.value, "tags", {}))
  
  depends_on = [
    module.vnet
  ]
}







# ###################
# ### SERVICE BUS ###
# ###################

# # Service Bus Module

module "servicebus" {
  source   = "./servicebus"
  for_each = var.servicebus_namespaces

  name                = each.value.name
  resource_group_name = coalesce(lookup(each.value, "resource_group_name", null), var.resource_group_name)
  location            = coalesce(lookup(each.value, "location", null), var.location)
  
  sku                 = lookup(each.value, "sku", "Standard")
  zone_redundant      = lookup(each.value, "zone_redundant", true)
  disable_local_auth  = lookup(each.value, "disable_local_auth", false)
  
  create_private_endpoint = lookup(each.value, "create_private_endpoint", null)
  private_endpoint_name   = lookup(each.value, "private_endpoint_name", null)
  
  # Get subnet ID from VNet module if subnet_name is provided
  subnet_id = try(
    module.vnet[lookup(each.value, "vnet_key", "vnet1")].subnet_ids[lookup(each.value, "subnet_name", "")],
    lookup(each.value, "subnet_id", null)
  )
  
  # Pass VNet ID for DNS zone linking
  vnet_id = try(
    module.vnet[lookup(each.value, "vnet_key", "vnet1")].vnet_id,
    null
  )
  
  private_dns_zone_ids = lookup(each.value, "private_dns_zone_ids", null)
  
  # Pass topics configuration
  topics = lookup(each.value, "topics", null)
  
  tags = merge(var.tags, lookup(each.value, "tags", {}))
}



# ###############
# ### STORAGE ###
# ###############

module "storage" {
  source   = "./storage"
  for_each = var.storage_accounts

  resource_group_name             = var.resource_group_name
  location                        = var.location
  name                            = each.value.name
  account_tier                    = lookup(each.value, "account_tier", "Standard")
  account_replication_type        = lookup(each.value, "account_replication_type", "LRS")
  account_kind                    = lookup(each.value, "account_kind", "StorageV2")
  access_tier                     = lookup(each.value, "access_tier", "Hot")
  enable_https_traffic_only       = lookup(each.value, "enable_https_traffic_only", true)
  min_tls_version                 = lookup(each.value, "min_tls_version", "TLS1_2")
  is_hns_enabled                  = lookup(each.value, "is_hns_enabled", false)
  nfsv3_enabled                   = lookup(each.value, "nfsv3_enabled", false)
  shared_access_key_enabled       = lookup(each.value, "shared_access_key_enabled", true)
  public_network_access_enabled   = lookup(each.value, "public_network_access_enabled", false)
  large_file_share_enabled        = lookup(each.value, "large_file_share_enabled", true)
  cross_tenant_replication_enabled = lookup(each.value, "cross_tenant_replication_enabled", false)
  
  network_default_action          = lookup(each.value, "network_default_action", "Deny")
  ip_rules                        = lookup(each.value, "ip_rules", [])
  virtual_network_subnet_ids      = lookup(each.value, "virtual_network_subnet_ids", [])
  network_bypass                  = lookup(each.value, "network_bypass", ["AzureServices"])
  
  create_private_endpoint         = lookup(each.value, "create_private_endpoint", true)
  private_endpoint_name           = lookup(each.value, "private_endpoint_name", null)
  
  subnet_id = try(
    module.vnet[lookup(each.value, "vnet_key", "vnet1")].subnet_ids[lookup(each.value, "subnet_name", "")],
    lookup(each.value, "subnet_id", null)
  )
  
  vnet_id = try(
    module.vnet[lookup(each.value, "vnet_key", "vnet1")].vnet_id,
    null
  )
  
  private_endpoint_subresources  = lookup(each.value, "private_endpoint_subresources", ["blob"])
  private_dns_zone_ids           = lookup(each.value, "private_dns_zone_ids", null)
  containers                     = lookup(each.value, "containers", [])
  tags                           = merge(var.tags, lookup(each.value, "tags", {}))
}



#############
### REDIS ###
#############


module "redis_instances" {
  source   = "./redis"
  for_each = var.redis_instances

  name                = each.value.name
  resource_group_name = coalesce(lookup(each.value, "resource_group_name", null), var.resource_group_name)
  location            = coalesce(lookup(each.value, "location", null), var.location)
  
  sku_name            = lookup(each.value, "sku_name", "Basic")
  family              = lookup(each.value, "family", "C")
  capacity            = lookup(each.value, "capacity", 0)
  
  enable_non_ssl_port = lookup(each.value, "enable_non_ssl_port", false)
  minimum_tls_version = lookup(each.value, "minimum_tls_version", "1.2")
  public_network_access_enabled = lookup(each.value, "public_network_access_enabled", true)
  
  maxmemory_reserved              = lookup(each.value, "maxmemory_reserved", "30")
  maxmemory_delta                 = lookup(each.value, "maxmemory_delta", "30")
  maxfragmentationmemory_reserved = lookup(each.value, "maxfragmentationmemory_reserved", "30")
  
  create_private_endpoint = lookup(each.value, "create_private_endpoint", true)
  private_endpoint_name   = lookup(each.value, "private_endpoint_name", null)
  
  subnet_id = try(
    module.vnet[lookup(each.value, "vnet_key", "vnet1")].subnet_ids[lookup(each.value, "subnet_name", "")],
    lookup(each.value, "subnet_id", null)
  )
  
  vnet_id = try(
    module.vnet[lookup(each.value, "vnet_key", "vnet1")].vnet_id,
    null
  )
  
  private_dns_zone_ids = lookup(each.value, "private_dns_zone_ids", null)
  
  tags = merge(var.tags, lookup(each.value, "tags", {}))
}




#############
### OPENAI ###
#############

module "openai" {
  source              = "./openai"
  for_each            = var.openai_accounts
  
  resource_group_name = var.resource_group_name
  location            = var.location
  name                = each.value.name
  sku_name            = lookup(each.value, "sku_name", "S0")
  custom_subdomain_name = lookup(each.value, "custom_subdomain_name", each.value.name)
  public_network_access_enabled = lookup(each.value, "public_network_access_enabled", false)
  
  # Network configuration
  network_default_action = lookup(each.value, "network_default_action", "Deny")
  ip_rules               = lookup(each.value, "ip_rules", [])
  virtual_network_subnet_ids = lookup(each.value, "virtual_network_subnet_ids", [])
  
  # Private endpoint configuration
  create_private_endpoint = lookup(each.value, "create_private_endpoint", true)
  private_endpoint_name   = lookup(each.value, "private_endpoint_name", null)
  
  subnet_id = try(
    module.vnet[lookup(each.value, "vnet_key", "vnet1")].subnet_ids[lookup(each.value, "subnet_name", "")],
    lookup(each.value, "subnet_id", null)
  )
  
  vnet_id = try(
    module.vnet[lookup(each.value, "vnet_key", "vnet1")].vnet_id,
    null
  )
  
  private_dns_zone_ids = lookup(each.value, "private_dns_zone_ids", null)
  
  # Model deployments
  model_deployments = lookup(each.value, "model_deployments", null)
  
  tags = merge(var.tags, lookup(each.value, "tags", {}))
}




# ###################
# ### postgresql ###
# ###################

module "postgresql" {
  source   = "./postgresql"
  for_each = var.postgresql_servers

  # Basic settings
  name                = each.value.name
  resource_group_name = coalesce(each.value.resource_group_name, var.resource_group_name)
  location            = coalesce(each.value.location, var.location)
  
  # Authentication settings
  administrator_login    = each.value.administrator_login
  administrator_password = each.value.administrator_password
  postgres_version       = each.value.postgres_version
  
  # Compute and storage settings
  sku_name                 = each.value.sku_name
  storage_size_gb          = each.value.storage_size_gb
  storage_auto_grow_enabled = each.value.storage_auto_grow_enabled
  availability_zone        = each.value.availability_zone
  
  # Backup settings
  backup_retention_days   = each.value.backup_retention_days
  geo_redundant_backup    = each.value.geo_redundant_backup
  
  # Authentication settings
  active_directory_auth_enabled = each.value.active_directory_auth_enabled
  password_auth_enabled         = each.value.password_auth_enabled
  
  # Maintenance window settings
  maintenance_window_enabled      = each.value.maintenance_window_enabled
  maintenance_window_day_of_week  = each.value.maintenance_window_day_of_week
  maintenance_window_start_hour   = each.value.maintenance_window_start_hour
  maintenance_window_start_minute = each.value.maintenance_window_start_minute
  
  # Databases and firewall rules
  databases      = each.value.databases
  firewall_rules = each.value.firewall_rules
  
  allow_azure_services = each.value.allow_azure_services

  # Tags
  tags = merge(var.tags, each.value.tags)
}

