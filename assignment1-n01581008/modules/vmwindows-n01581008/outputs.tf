output "hostname" {
  description = "Hostname of the Windows VM"
  value       = azurerm_virtual_machine.windows_vm.os_profile[*].computer_name
}

output "fqdn" {
  description = "Domain name of Windows VM"
  value       = azurerm_public_ip.public_ip.fqdn
}
output "private_ip_address" {
  description = "Private IP address of the Windows VM"
  value       = azurerm_network_interface.network_interface[*].private_ip_address
}

output "public_ip_address" {
  description = "Public IP address of the Windows VM"
  value       = azurerm_public_ip.public_ip[*].ip_address
}
variable "virtual_network_name" {
  description = "Name of the virtual network"
  type        = string
  default = "n01581008-VNET"
}

