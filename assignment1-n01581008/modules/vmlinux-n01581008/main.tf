resource "azurerm_subnet" "humber_subnet" {
  name                 = "humber-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = "n01581008-VNET"
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_public_ip" "public_ip" {
  count               = length(var.vm_dns_labels)
  name                = "${var.vm_dns_labels[count.index]}-pip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "network_interface" {
  count               = length(var.vm_dns_labels)
  name                = "${var.vm_dns_labels[count.index]}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "${var.vm_dns_labels[count.index]}-ipconfig"
    subnet_id                     = azurerm_subnet.humber_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip[count.index].id
  }

  tags = local.tags
}
resource "azurerm_linux_virtual_machine" "linux_vm" {
  count               = length(var.vm_dns_labels)
  name                = "${var.vm_dns_labels[count.index]}-vm"
  computer_name       = var.computer_name
  location            = var.location
  resource_group_name = var.resource_group_name
  size                = var.vm_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  disable_password_authentication = false

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "OpenLogic"
    offer     = "CentOS"
    sku       = "8_2"
    version   = "latest"
  }

network_interface_ids = [azurerm_network_interface.network_interface[count.index].id]
  tags = local.tags
  provisioner "remote-exec" {
  connection {
      host        = azurerm_public_ip.public_ip[count.index].ip_address
      type        = "ssh"
      user        = var.admin_username
      password    = var.admin_password
    }
  inline = [
      "echo 'This is remote exec'",
      "echo 'Hostname: $(hostname)'",
  ]
  }
}
