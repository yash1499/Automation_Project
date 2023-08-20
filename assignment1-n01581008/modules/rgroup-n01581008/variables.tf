variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "n01581008-RG"
}
variable "location" {
  description = "Location of the resource group"
  type        = string
  default     = "canada central"
}
locals {
  tags = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name           = "Yashkumar Patel"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
  }
}
