resource "azurerm_managed_disk" "data_disk" {
  count               = 3
  name                = "datadisk${count.index}"
  location            = var.location
  resource_group_name = var.resource_group_name
  storage_account_type = "Standard_LRS"
  create_option       = "Empty"
  disk_size_gb        = var.disk_size_gb
  tags = local.tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "data_disk_attachment" {
  count                 = length(var.virtual_machine_ids)
  managed_disk_id       = azurerm_managed_disk.data_disk[count.index].id
  virtual_machine_id    = var.virtual_machine_ids[count.index]
  lun                   = count.index
  caching               = "None"

}

