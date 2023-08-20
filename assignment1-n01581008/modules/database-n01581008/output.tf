output "db_instance_name" {
  description = "Name of the DB instance"
  value       = azurerm_postgresql_server.database_instance.name
}

