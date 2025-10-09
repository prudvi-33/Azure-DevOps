output "id" {
  description = "The ID of the PostgreSQL Flexible Server"
  value       = azurerm_postgresql_flexible_server.postgres.id
}

output "name" {
  description = "The name of the PostgreSQL Flexible Server"
  value       = azurerm_postgresql_flexible_server.postgres.name
}

output "fqdn" {
  description = "The FQDN of the PostgreSQL Flexible Server"
  value       = azurerm_postgresql_flexible_server.postgres.fqdn
}

output "administrator_login" {
  description = "The administrator login for the PostgreSQL Flexible Server"
  value       = azurerm_postgresql_flexible_server.postgres.administrator_login
  sensitive   = true
}

output "database_ids" {
  description = "Map of database names to their IDs"
  value       = { for db_name, db in azurerm_postgresql_flexible_server_database.db : db_name => db.id }
}
