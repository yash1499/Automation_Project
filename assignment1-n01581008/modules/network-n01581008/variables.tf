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

variable "virtual_network_name" {
  description = "Name of the virtual network"
  type        = string
  default     = "n01581008-VNET"
}

variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
  default     = "n01581008-SUBNET"
}

variable "network_security_group_name" {
  description = "Name of the network security group"
  type        = string
  default     = "n01581008-NSG"
}
locals {
  tags = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name           = "Yashkumar Patel"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
  }
}
