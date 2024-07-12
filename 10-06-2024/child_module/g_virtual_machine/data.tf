data "azurerm_network_interface" "tcs_nic_data_01" {
  for_each            = var.virtual_machine
  name                = each.value.nic_name
  resource_group_name = each.value.resource_group_name
}

# data "azurerm_key_vault" "tcsvkey" {
#   name                = "tcsvault1989"
#   resource_group_name = "tcs_official"
# }


# data "azurerm_key_vault_secret" "pass" {
#   name         = "secret-password"
#   key_vault_id = data.azurerm_key_vault.tcsvkey.id
# }
