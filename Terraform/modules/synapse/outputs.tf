output "workspace_id" {
   description = "The ID of the Synapse Workspace"
   value       = azurerm_synapse_workspace.synapse.id
 }

 output "workspace_name" {
   description = "The name of the Synapse Workspace"
   value       = azurerm_synapse_workspace.synapse.name
 }

 output "storage_account_id" {
   description = "The ID of the Storage Account"
   value       = azurerm_storage_account.datalake.id
 }

 output "filesystem_id" {
   description = "The ID of the Data Lake Filesystem"
   value       = azurerm_storage_data_lake_gen2_filesystem.filesystem.id
 }

 output "workspace_web_endpoint" {
   description = "The web endpoint of the Synapse Workspace"
   value       = azurerm_synapse_workspace.synapse.connectivity_endpoints["web"]
 }
