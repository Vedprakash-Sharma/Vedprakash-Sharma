data "azurerm_subnet" "app_subnet" {
  for_each = var.application_gatway
  name                 = "agw_subnet"
  virtual_network_name = "tcs_network"
  resource_group_name  = "Home_office"
}

data "azurerm_network_interface" "asso_pool01" {
  for_each = var.application_gatway
  name                = "tcs_nic_01"
  resource_group_name = "Home_office"
}

data "azurerm_network_interface" "asso_pool02" {
  for_each = var.application_gatway
  name                = "tcs_nic_02"
  resource_group_name = "Home_office"
}