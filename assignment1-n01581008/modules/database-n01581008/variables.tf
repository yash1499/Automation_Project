variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "n01581008-RG"
}

variable "location" {
  description = "Location of the resources"
  type        = string
  default     = "canada central"
}

variable "database_name" {
  description = "Name of the Azure DB for PostgreSQL instance"
  type        = string
  default     = "mydatabases"
}

variable "database_sku_name" {
  description = "SKU name for the Azure DB for PostgreSQL instance"
  type        = string
  default     = "B_Gen5_2"
}

variable "database_version" {
  description = "Version of the Azure DB for PostgreSQL instance"
  type        = string
  default     = "11"
}

variable "database_storage_mb" {
  description = "Storage capacity in megabytes for the Azure DB for PostgreSQL instance"
  type        = number
  default     = 5120
}

variable "database_backup_retention_days" {
  description = "Number of days to retain backups for the Azure DB for PostgreSQL instance"
  type        = number
  default     = 7
}

variable "database_geo_redundant_backup" {
  description = "Enable or disable geo-redundant backup for the Azure DB for PostgreSQL instance"
  type        = bool
  default     = false
}

locals {
  tags = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name           = "Yashkumar Patel"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
  }
}
