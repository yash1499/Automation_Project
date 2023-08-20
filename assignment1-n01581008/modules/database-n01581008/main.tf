resource "azurerm_postgresql_server" "database_instance" {
  name                = var.database_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = var.database_sku_name
  version             = var.database_version
  ssl_enforcement_enabled = true
  administrator_login = "yash1008"
  administrator_login_password = "Pa$$word1008@"
  tags = local.tags
}


