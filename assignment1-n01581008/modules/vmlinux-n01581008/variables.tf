variable "location" {
  description = "Location of the resources"
  type        = string
  default     = "canada central"
}
variable "computer_name" {
  description = "Computer name"
  type        = string
  default     = "Yash1008"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "n01581008-RG"
}

variable "vm_dns_labels" {
  description = "DNS labels for the Linux VMs"
  type        = list(string)
  default     = ["vm1", "vm2", "vm3"]
}

variable "vm_size" {
  description = "Size of the Linux VMs"
  type        = string
  default     = "Standard_B2s"
}

variable "admin_username" {
  description = "Admin username for the Linux VMs"
  type        = string
  default     = "admin1008"
}
variable "admin_password" {
  description = "Admin password for the Linux VMs"
  type        = string
  default     = "Pa$$word@1008"
}
locals {
  tags = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name           = "Yashkumar Patel"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
  }
}

