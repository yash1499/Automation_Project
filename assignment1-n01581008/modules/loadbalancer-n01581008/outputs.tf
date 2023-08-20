output "load_balancer_name" {
  description = "Name of the load balancer"
  value       = azurerm_lb.load_balancer.name
}
output "load_balancer_id" {
  description = "ID of the load balancer"
  value = "/subscriptions/7853a8aa-adbe-49ca-bf18-d47a86146c8b/resourceGroups/n01581008-RG/providers/Microsoft.Network/loadBalancers/n01581008-LB"
}
output "subnet_id" {
   description = "ID of the subnet where the network interfaces will be created."
   value       = "/subscriptions/7853a8aa-adbe-49ca-bf18-d47a86146c8b/resourceGroups/n01581008-RG/providers/Microsoft.Network/virtualNetworks/n01581008-VNET/subnets/humber-subnet"
}

