module "rgroup-n01581008" {
  source              = "./modules/rgroup-n01581008"
  resource_group_name  = module.rgroup-n01581008.resource_group_name
}

module "network-n01581008" {
  source               = "./modules/network-n01581008"
  resource_group_name  = module.rgroup-n01581008.resource_group_name
  virtual_network_name = "n01581008-VNET"
  subnet_name          = "n01581008-SUBNET"
}

module "common-n01581008" {
  source                = "./modules/common-n01581008"
  resource_group_name   = module.rgroup-n01581008.resource_group_name
}

module "vmlinux-n01581008" {
  source               = "./modules/vmlinux-n01581008"
  resource_group_name  = module.rgroup-n01581008.resource_group_name
}

module "vmwindows-n01581008" {
  source              = "./modules/vmwindows-n01581008"
  resource_group_name = module.rgroup-n01581008.resource_group_name
}

module "datadisk-n01581008" {
  source                = "./modules/datadisk-n01581008"
  resource_group_name   = module.rgroup-n01581008.resource_group_name
  virtual_machine_ids   = module.vmlinux-n01581008.virtual_machine_ids
}

module "loadbalancer-n01581008" {
  source              = "./modules/loadbalancer-n01581008"
  resource_group_name = module.rgroup-n01581008.resource_group_name
  virtual_machine_ids = module.vmlinux-n01581008.virtual_machine_ids
  subnet_id           = "/subscriptions/7853a8aa-adbe-49ca-bf18-d47a86146c8b/resourceGroups/n01581008-RG/providers/Microsoft.Network/virtualNetworks/n01581008-VNET/subnets/humber-subnet"
}

module "database-n01581008" {
  source               = "./modules/database-n01581008"
  resource_group_name  = module.rgroup-n01581008.resource_group_name
}

