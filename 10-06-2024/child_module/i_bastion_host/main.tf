resource "azurerm_public_ip" "bastion_pip" {
  for_each = var.Bastion_host
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  allocation_method   = each.value.allocation_method
  sku                 = each.value.sku
}

resource "azurerm_bastion_host" "Bastion_host" {
  for_each = var.Bastion_host
  name                = each.value.name_host
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                 = each.value.name_ipc
    subnet_id            = data.azurerm_subnet.bastion_subnet[each.key].id
    public_ip_address_id = azurerm_public_ip.bastion_pip[each.key].id
  }
}