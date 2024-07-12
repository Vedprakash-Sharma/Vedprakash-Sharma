resource "azurerm_storage_account" "st" {
  for_each                 = var.all_resource_backend
  name                     = each.value.name
  resource_group_name      = each.value.resource_group_name
  location                 = each.value.location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type
}


resource "azurerm_storage_container" "con" {
  for_each              = var.all_resource_backend
  name                  = each.value.con_name
  storage_account_name  = azurerm_storage_account.st[each.key].name
  container_access_type = each.value.container_access_type
}