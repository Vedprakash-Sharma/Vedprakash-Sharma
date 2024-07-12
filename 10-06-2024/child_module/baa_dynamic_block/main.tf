resource "azurerm_virtual_network" "dynamic_vs" {
  for_each            = var.dyanamic_vnet
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  address_space       = each.value.address_space
  dns_servers         = each.value.dns_servers

  dynamic "subnet" {
    for_each = each.value.dynamic_vnet_subnet

    content {
      name           = subnet.value.subnet_name
      address_prefix = subnet.value.address_prefix
    }
  }
}