variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "n01581008-RG"
}
variable "subnet_id" {
  description = "ID of the subnet where the network interfaces will be created."
  type        = string
  default = "/subscriptions/7853a8aa-adbe-49ca-bf18-d47a86146c8b/resourceGroups/n01581008-RG/providers/Microsoft.Network/virtualNetworks/n01581008-VNET/subnets/humber-subnet"
}


variable "load_balancer_name" {
  description = "Name of the load balancer"
  type        = string
  default     = "n01581008-LB"
}

variable "backend_pool_name" {
  description = "Name of the backend pool"
  type        = string
  default     = "n01581008-BP"
}

variable "backend_port" {
  description = "Port number for the backend pool"
  type        = number
    default     = "8080"
}

variable "frontend_port" {
  description = "Port number for the frontend"
  type        = number
  default     = "80"
}

variable "frontend_ip_name" {
  description = "Name of the frontend IP configuration"
  type        = string
  default     = "n01581008-FIP"
}

variable "probe_name" {
  description = "Name of the probe"
  type        = string
  default     = "http-probe"
}

variable "virtual_machine_ids" {
  description = "IDs of the virtual machines"
  type        = list(string)
}
variable "location" {
  description = "Location of the resources"
  type        = string
  default     = "canada central"
}
variable "vm_dns_labels" {
  description = "DNS labels for the Linux VMs"
  type        = list(string)
  default     = ["vm1", "vm2", "vm3"]
}
locals {
  tags = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name           = "Yashkumar Patel"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
  }
}

