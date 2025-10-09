resource "azurerm_postgresql_flexible_server" "postgres" {
  name                   = var.name
  resource_group_name    = var.resource_group_name
  location               = var.location
  version                = var.postgres_version
  administrator_login    = var.administrator_login
  administrator_password = var.administrator_password
  
  # Storage settings at the top level
  storage_mb             = var.storage_size_gb * 1024
  auto_grow_enabled      = var.storage_auto_grow_enabled
  
  sku_name               = var.sku_name
  zone                   = var.availability_zone
  
  backup_retention_days        = var.backup_retention_days
  geo_redundant_backup_enabled = var.geo_redundant_backup

  # Authentication configuration
  authentication {
    active_directory_auth_enabled = var.active_directory_auth_enabled
    password_auth_enabled         = var.password_auth_enabled
  }

  # Maintenance window if specified
  dynamic "maintenance_window" {
    for_each = var.maintenance_window_enabled ? [1] : []
    content {
      day_of_week  = var.maintenance_window_day_of_week
      start_hour   = var.maintenance_window_start_hour
      start_minute = var.maintenance_window_start_minute
    }
  }
  
  tags = var.tags
  
  lifecycle {
    ignore_changes = [
      zone
    ]
  }
}

# Create a database in the PostgreSQL Server if specified
resource "azurerm_postgresql_flexible_server_database" "db" {
  for_each = { for db in var.databases : db.name => db }
  
  name      = each.value.name
  server_id = azurerm_postgresql_flexible_server.postgres.id
  charset   = each.value.charset
  collation = each.value.collation
}

# Create a firewall rule for the PostgreSQL Server if specified
resource "azurerm_postgresql_flexible_server_firewall_rule" "firewall_rules" {
  for_each = { for rule in var.firewall_rules : rule.name => rule }
  
  name             = each.value.name
  server_id        = azurerm_postgresql_flexible_server.postgres.id
  start_ip_address = each.value.start_ip_address
  end_ip_address   = each.value.end_ip_address
}

resource "azurerm_postgresql_flexible_server_firewall_rule" "allow_azure_services" {
  count = var.allow_azure_services ? 1 : 0
  
  name             = "AllowAzureServices"
  server_id        = azurerm_postgresql_flexible_server.postgres.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}
