terraform {
  backend "azurerm" {
    storage_account_name = "cs210032000bdc1a93d"
    container_name       = "automationcontainer"
    key                  = "terraform-state.tfstate"
    access_key           = "3rR+gMT9VN2SIEyP0D+wm5RXMoa9PzjhNSP0xQwD//auABN74gvsy3LCNdZ1jxB2ct/00XkenEsV+AStbHk77A=="
  }
}

