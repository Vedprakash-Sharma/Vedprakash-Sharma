resource "azurerm_virtual_network_peering" "offical" {
    for_each = var.vnet_local
  name                      = "peering_01_to_02"
  resource_group_name       = "tcs_offical"
  virtual_network_name      = "tcs_network"
  remote_virtual_network_id = data.azurerm_virtual_network.peering[each.key].id
}

resource "azurerm_virtual_network_peering" "peering" {
    for_each = var.vnet_local
  name                      = "peering_02_to_01"
  resource_group_name       = "tcs_offical"
  virtual_network_name      = "tcs_network_peering"
  remote_virtual_network_id = data.azurerm_virtual_network.offical[each.key].id
}