resource "azurerm_resource_group" "tcs_project" {
  for_each = var.rg_12
  name     = each.value.name
  location = each.value.location
}
