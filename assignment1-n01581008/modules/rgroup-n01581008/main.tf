resource "azurerm_resource_group" "humber_rg" {
  name     = "n01581008-RG"
  location = var.location
  tags = local.tags
}


