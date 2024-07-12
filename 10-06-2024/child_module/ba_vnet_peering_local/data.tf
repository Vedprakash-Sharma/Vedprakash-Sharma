data "azurerm_virtual_network" "offical" {
    for_each = var.vnet_local
  name                = "tcs_network"
  resource_group_name = "tcs_offical"
}

data "azurerm_virtual_network" "peering" {
    for_each = var.vnet_local
  name                = "tcs_network_peering"
  resource_group_name = "tcs_offical"
}