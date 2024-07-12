resource "azurerm_network_interface" "nic_12_01" {
  for_each            = var.nic_12
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name


  ip_configuration {
    name                          = each.value.ip_con_name
    subnet_id                     = data.azurerm_subnet.tcs_data_subnet[each.key].id
    private_ip_address_allocation = each.value.private_ip_address_allocation
  }
}