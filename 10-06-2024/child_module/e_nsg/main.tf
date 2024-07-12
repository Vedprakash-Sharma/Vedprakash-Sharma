resource "azurerm_network_security_group" "nsgforlb" {
  for_each            = var.rgnsg99
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
    security_rule {
    name                       = "ssh"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "http"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "https"
    priority                   = 120
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "subnetasso" {
  for_each = var.rgnsg99
  subnet_id                 = data.azurerm_subnet.tcs_data_subnet.id
  network_security_group_id = azurerm_network_security_group.nsgforlb[each.key].id
}

resource "azurerm_network_interface_security_group_association" "nicasso_01" {
  for_each = var.rgnsg99
  network_interface_id      = data.azurerm_network_interface.asso_nsg01.id
  network_security_group_id = azurerm_network_security_group.nsgforlb[each.key].id
}

resource "azurerm_network_interface_security_group_association" "nicasso_02" {
  for_each = var.rgnsg99
  network_interface_id      = data.azurerm_network_interface.asso_nsg02.id
  network_security_group_id = azurerm_network_security_group.nsgforlb[each.key].id
}