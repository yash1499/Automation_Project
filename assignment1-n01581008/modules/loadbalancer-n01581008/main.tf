resource "azurerm_public_ip" "public_ip" {
  name                = "${var.load_balancer_name}-publicip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  tags = local.tags
}

resource "azurerm_lb" "load_balancer" {
  name                = var.load_balancer_name
  location            = var.location
  resource_group_name = var.resource_group_name

  frontend_ip_configuration {
    name                 = var.frontend_ip_name
    public_ip_address_id = azurerm_public_ip.public_ip.id
  }
  tags = local.tags
}

resource "azurerm_lb_backend_address_pool" "backend_address_pool" {
  name             = "backend-pool"
  loadbalancer_id  = azurerm_lb.load_balancer.id

}

resource "azurerm_lb_probe" "probe" {
  name                = var.probe_name
  loadbalancer_id     = azurerm_lb.load_balancer.id
  protocol            = "Tcp"
  port                = var.backend_port
  interval_in_seconds = 5
  number_of_probes    = 2
}

resource "azurerm_network_interface" "network_interface" {
  count               = length(var.virtual_machine_ids)
  name = "${var.vm_dns_labels[count.index]}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name
  ip_configuration {
    name                          = "config1"
    private_ip_address_allocation = "Dynamic"
    subnet_id           = "/subscriptions/7853a8aa-adbe-49ca-bf18-d47a86146c8b/resourceGroups/n01581008-RG/providers/Microsoft.Network/virtualNetworks/n01581008-VNET/subnets/humber-subnet"
  public_ip_address_id          = azurerm_public_ip.public_ip.id
 }
 tags = local.tags
}

resource "azurerm_network_interface_backend_address_pool_association" "nic_backend_pool_association" {
  count                     = length(var.virtual_machine_ids)
  network_interface_id      = azurerm_network_interface.network_interface[count.index].id
  ip_configuration_name     = "config1"
  backend_address_pool_id    = azurerm_lb_backend_address_pool.backend_address_pool.id
  depends_on                = [azurerm_lb.load_balancer]
}

resource "azurerm_lb_rule" "lb_rule" {
  name                           = "lb-rule"
  loadbalancer_id                = azurerm_lb.load_balancer.id
  protocol                       = "Tcp"
  frontend_port                  = var.frontend_port
  backend_port                   = var.backend_port
  frontend_ip_configuration_name = var.frontend_ip_name
}

