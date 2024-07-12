resource "azurerm_virtual_network" "vnet" {
    for_each = var.vnetrg
    name = each.value.name
    resource_group_name = each.value.resource_group_name
    address_space = each.value.address_space
    dns_servers = each.value.dns_servers
    location = each.value.location
  
}