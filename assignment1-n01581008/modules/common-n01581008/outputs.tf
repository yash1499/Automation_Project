output "log_analytics_workspace_name" {
  description = "Name of the log analytics workspace"
  value       = azurerm_log_analytics_workspace.humber_law.name
}

output "recovery_services_vault_name" {
  description = "Name of the recovery services vault"
  value       = azurerm_recovery_services_vault.humber_rsv.name
}

output "storage_account_name" {
  description = "Name of the storage account"
  value       = azurerm_storage_account.humber_storage.name
}

