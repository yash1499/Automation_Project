resource "azurerm_public_ip" "public_ip" {
  name                = "${var.vm_dns_label}-public-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  tags = local.tags
}

resource "azurerm_virtual_machine" "windows_vm" {
  name                = "${var.vm_dns_label}-vm"
  location            = var.location
  resource_group_name = var.resource_group_name
  availability_set_id = azurerm_availability_set.availability_set.id
  vm_size             = "Standard_DS1_v2"
  depends_on = [azurerm_network_interface.network_interface]
  network_interface_ids = [azurerm_network_interface.network_interface.id]

  os_profile {
    computer_name  = var.vm_dns_label
    admin_username = var.admin_username
    admin_password = var.admin_password
  }
  os_profile_windows_config {
    enable_automatic_upgrades = true
    provision_vm_agent        = true
  }
  storage_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }

  storage_os_disk {
    name              = "${var.vm_dns_label}-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Premium_LRS"
  }

  tags = local.tags

 provisioner "local-exec" {
    command = "echo ' this is local exec '"
  }

}
resource "azurerm_virtual_machine_extension" "antimalware_extension" {
  name                       = "${var.vm_dns_label}-antimalware-extension"
  virtual_machine_id         = azurerm_virtual_machine.windows_vm.id
  publisher                  = "Microsoft.Azure.Security"
  type                       = "IaaSAntimalware"
  type_handler_version       = "1.3"
  auto_upgrade_minor_version = true

  settings = <<SETTINGS
  {
    "AntimalwareEnabled": true,
    "RealtimeProtectionEnabled": true,
    "ScheduledScanSettings": {
      "isEnabled": true,
      "day": "7",
      "time": "120"
    }
  }
  SETTINGS
}

resource "azurerm_availability_set" "availability_set" {
  name                = "${var.vm_dns_label}-availability-set"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags = local.tags
}

resource "azurerm_subnet" "humber_subnet" {
  name                 = "humber-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_network_interface" "network_interface" {
  name                = "${var.vm_dns_label}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "${var.vm_dns_label}-ipconfig"
    subnet_id                     = azurerm_subnet.humber_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip.id
  }
  tags = local.tags
}
resource "null_resource" "windows_provisioner" {
  count = length(azurerm_virtual_machine.windows_vm)

  connection {
    host        = azurerm_public_ip.public_ip.ip_address
    type        = "winrm"
    user        = var.admin_username
    password    = var.admin_password
    insecure    = true
  }

  provisioner "remote-exec" {
  inline = [
      "echo 'This is a remote-exec provisioner.'",
    ]
  }
}
