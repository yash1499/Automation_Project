variable "location" {
  description = "Location of the resources"
  type        = string
  default     = "canada central"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "n01581008-RG"
}

variable "vm_dns_label" {
  description = "DNS label for the Windows VM"
  type        = string
  default     = "windows-vm"
}

variable "admin_username" {
  description = "Admin username for the Windows VM"
  type        = string
  default     = "admin1008"
}

variable "admin_password" {
  description = "Admin password for the Windows VM"
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
