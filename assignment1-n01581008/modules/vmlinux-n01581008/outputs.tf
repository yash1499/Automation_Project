output "hostnames" {
  value       = [for vm in azurerm_linux_virtual_machine.linux_vm : vm.computer_name]
}

output "domain_names" {
  value       = [for vm in azurerm_linux_virtual_machine.linux_vm : vm.computer_name]
}

output "virtual_machine_ids" {
  value       = [for vm in azurerm_linux_virtual_machine.linux_vm : vm.id]
}

output "private_ip_addresses" {
  description = "Private IP addresses of the Linux VMs"
  value       = azurerm_network_interface.network_interface[*].private_ip_address
}

output "public_ip_addresses" {
  description = "Public IP addresses of the Linux VMs"
  value       = azurerm_public_ip.public_ip[*].ip_address
}
output "virtual_network_name" {
  description = "Name of the virtual network"
  value       = azurerm_virtual_network.humber_vnet.name
}

output "subnet_name" {
  description = "Name of the subnet"
  value       = azurerm_subnet.humber_subnet.name
}

