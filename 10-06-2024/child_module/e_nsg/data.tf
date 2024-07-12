data "azurerm_subnet" "tcs_data_subnet" {
 
  name                 = "tcs_subnet_project"
  virtual_network_name = "tcs_network"
  resource_group_name  = "Home_office"
}
data "azurerm_network_interface" "asso_nsg01" {
  name                = "tcs_nic_01"
  resource_group_name = "Home_office"
}

data "azurerm_network_interface" "asso_nsg02" {
  name                = "tcs_nic_02"
  resource_group_name = "Home_office"
}