module "resource_group" {
  source = "../../child_module/a_Resource_group"
  rg_12  = var.rg_12
}
module "Storage_Container" {
  source               = "../../child_module/all_Storage_Container"
  all_resource_backend = var.all_resource_backend
  depends_on           = [module.resource_group]
}
module "dynamic" {
  source        = "../../child_module/baa_dynamic_block"
  dyanamic_vnet = var.dyanamic_vnet
  depends_on    = [module.resource_group]
}
module "subnet" {
  source     = "../../child_module/c_subnet"
  subnet_12  = var.subnet_12
  depends_on = [module.resource_group, module.vnetm]
}

module "virtual_network" {
  source     = "../../child_module/d_NIC"
  nic_12     = var.nic_12
  depends_on = [module.resource_group, module.subnet]
}

module "network_sequrity_group" {
  source     = "../../child_module/e_nsg"
  rgnsg99    = var.rgnsg99
  depends_on = [module.resource_group, module.virtual_network]
}

module "vnetm" {
  source     = "../../child_module/v_net"
  vnetrg     = var.vnetrg
  depends_on = [module.resource_group, ]
}
