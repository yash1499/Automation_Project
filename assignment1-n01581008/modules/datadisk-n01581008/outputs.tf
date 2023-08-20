output "data_disk_ids" {
  description = "IDs of the data disks"
  value       = azurerm_managed_disk.data_disk[*].id
}

