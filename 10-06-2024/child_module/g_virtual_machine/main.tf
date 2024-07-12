resource "azurerm_linux_virtual_machine" "tcsvm12" {
  for_each                        = var.virtual_machine
  name                            = each.value.name
  resource_group_name             = each.value.resource_group_name
  location                        = each.value.location
  size                            = each.value.size
  admin_username                  = each.value.admin_username
  admin_password                  = "ved@1234"
  disable_password_authentication = false
  network_interface_ids = [
    data.azurerm_network_interface.tcs_nic_data_01[each.key].id,
  ]


  os_disk {
    caching              = each.value.caching
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = each.value.publisher
    offer     = each.value.offer
    sku       = each.value.sku
    version   = each.value.version
  }

}
