 Storage Account for Synapse
 resource "azurerm_storage_account" "datalake" {
   name                     = var.storage_account_name
   resource_group_name      = var.resource_group_name
   location                 = var.location
   account_tier             = var.storage_account_tier
   account_replication_type = var.storage_account_replication_type
   account_kind             = var.storage_account_kind
   is_hns_enabled           = var.storage_is_hns_enabled

   tags = var.tags
 }

Data Lake Gen2 Filesystem
 resource "azurerm_storage_data_lake_gen2_filesystem" "filesystem" {
   name               = var.filesystem_name
   storage_account_id = azurerm_storage_account.datalake.id
 }

 Synapse Workspace Resource
 resource "azurerm_synapse_workspace" "synapse" {
   name                                 = var.name
   resource_group_name                  = var.resource_group_name
   location                             = var.location
   storage_data_lake_gen2_filesystem_id = azurerm_storage_data_lake_gen2_filesystem.filesystem.id
  
   sql_administrator_login              = var.sql_admin_username
   sql_administrator_login_password     = var.sql_admin_password

 Identity Configuration
   identity {
     type = coalesce(var.identity_type, "SystemAssigned")
   }

 Network Configuration
   public_network_access_enabled = var.public_network_access_enabled
  
 Azure AD Authentication
   azuread_authentication_only = var.azuread_only_authentication

 Optional Tags
   tags = var.tags
 }

 Optional Storage Account Network Rules
 resource "azurerm_storage_account_network_rules" "firewall_rules" {
   count = length(var.allowed_ip_ranges) > 0 ? 1 : 0

   storage_account_id = azurerm_storage_account.datalake.id

   default_action             = "Deny"
   ip_rules                   = var.allowed_ip_ranges
   virtual_network_subnet_ids = var.allowed_subnet_ids
   bypass                     = ["AzureServices"]
 }

 Optional Private Endpoint
 resource "azurerm_private_endpoint" "synapse_endpoint" {
   count               = coalesce(var.enable_private_endpoint, false) ? 1 : 0
   name                = "${var.name}-private-endpoint"
   location            = var.location
   resource_group_name = var.resource_group_name
   subnet_id           = var.private_endpoint_subnet_id

   private_service_connection {
     name                           = "${var.name}-privateserviceconnection"
     private_connection_resource_id = azurerm_synapse_workspace.synapse.id
     is_manual_connection           = false
     subresource_names              = ["Web"]
   }
 }

 Optional Synapse Firewall Rules
 resource "azurerm_synapse_firewall_rule" "example" {
   for_each = var.synapse_firewall_rules

   name                 = each.key
   synapse_workspace_id = azurerm_synapse_workspace.synapse.id
   start_ip_address     = each.value.start_ip_address
   end_ip_address       = each.value.end_ip_address
 }
