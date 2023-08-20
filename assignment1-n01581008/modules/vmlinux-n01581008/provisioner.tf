resource "null_resource" "linux_provisioner" {
  count = length(azurerm_linux_virtual_machine.linux_vm)

  connection {
    host        = azurerm_linux_virtual_machine.linux_vm[count.index].public_ip_address
    type        = "ssh"
    user        = var.admin_username
    password    = var.admin_password
  }

  provisioner "remote-exec" {
    inline = [
      "echo 'Provisioning Linux VM ${count.index + 1}'",
    ]
  }
}

