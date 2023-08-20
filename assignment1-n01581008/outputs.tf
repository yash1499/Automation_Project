output "resource_group_name" {
  value = module.rgroup-n01581008.resource_group_name
}

output "log_analytics_workspace_name" {
  value = module.common-n01581008.log_analytics_workspace_name
}
output "recovery_services_vault_name" {
  value = module.common-n01581008.recovery_services_vault_name
}
output "storage_account_name" {
  value = module.common-n01581008.storage_account_name
}

output "linux_vm_details" {
  value = module.vmlinux-n01581008.hostnames
}
output "linux_vm_hostnames" {
  value = module.vmlinux-n01581008.hostnames
}
output "linux_FDQN" {
  value = module.vmlinux-n01581008.domain_names
}
output "linux_private_ip_address" {
  value = module.vmlinux-n01581008.private_ip_addresses
}
output "linux_public_ip_address" {
  value = module.vmlinux-n01581008.public_ip_addresses
}

output "virtual_network_name" {
  value = module.network-n01581008.virtual_network_name
}

output "subnet_name" {
  value = module.network-n01581008.subnet_name
}

output "windows_FDQN" {
  value = nonsensitive(module.vmwindows-n01581008.hostname)
}
output "windows_private_ip_address" {
  value = module.vmwindows-n01581008.private_ip_address
}
output "windows_public_ip_address" {
  value = module.vmwindows-n01581008.public_ip_address
}
output "windows_vm_details" {
  value = nonsensitive(module.vmwindows-n01581008.hostname)
}
output "datadisk_details" {
  value = module.datadisk-n01581008.data_disk_ids
}

output "load_balancer_name" {
  value = module.loadbalancer-n01581008.load_balancer_name
}
output "windows_vm_hostnames" {
  value = nonsensitive(module.vmwindows-n01581008.hostname)
}

output "database_instance_name" {
  value = module.database-n01581008.db_instance_name
}

