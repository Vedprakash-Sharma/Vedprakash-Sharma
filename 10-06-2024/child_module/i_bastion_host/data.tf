data "azurerm_subnet" "bastion_subnet" {
  for_each = var.Bastion_host
  name                 = each.value.name_subnet
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}