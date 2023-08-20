variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "n01581008-RG" 
}

variable "virtual_machine_ids" {
  description = "IDs of the virtual machines"
  type        = list(string)
}

variable "disk_size_gb" {
  description = "Size of the data disk in GB"
  type        = number
  default     = 10
}
variable "location" {
  description = "The location of the resources"
  type        = string
  default     = "canada central"
}

variable "assignment_tag" {
  description = "The assignment tag for the resources"
  type        = string
  default     = "CCGC 5502 Automation Assignment"
}

variable "name_tag" {
  description = "The name tag for the resources"
  type        = string
  default     = "Yashkumar Patel"
}

variable "expiration_date_tag" {
  description = "The expiration date tag for the resources"
  type        = string
  default     = "2024-12-31"
}

variable "environment_tag" {
  description = "The environment tag for the resources"
  type        = string
  default     = "Learning"
}
locals {
  tags = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name           = "Yashkumar Patel"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
  }
}
