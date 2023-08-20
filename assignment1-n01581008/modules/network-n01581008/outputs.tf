output "virtual_network_name" {
  value = azurerm_subnet.humber_subnet.virtual_network_name
}

output "subnet_name" {
  value = azurerm_subnet.humber_subnet.name
}
