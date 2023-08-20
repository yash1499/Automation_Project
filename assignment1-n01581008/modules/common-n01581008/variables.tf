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

variable "log_analytics_workspace_name" {
  description = "Name of the log analytics workspace"
  type        = string
  default     = "n01581008-LAW"
}

variable "recovery_services_vault_name" {
  description = "Name of the recovery services vault"
  type        = string
  default     = "n01581008-RSV"
}

variable "storage_account_name" {
  description = "Name of the storage account"
  type        = string
  default     = "n01581008sa"
}

variable "assignment_tag" {
  description = "Tag for assignment"
  type        = string
  default     = "CCGC 5502 Automation Assignment"
}

variable "name_tag" {
  description = "Tag for name"
  type        = string
  default     = "Yashkumar Patel"
}

variable "expiration_date_tag" {
  description = "Tag for expiration date"
  type        = string
  default     = "2024-12-31"
}

variable "environment_tag" {
  description = "Tag for environment"
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
