rg_12 = {
  rg_01 = {
    name     = "Home_office"
    location = "westus"
  }
  rg_02 = {
    name     = "tcs_official"
    location = "eastus"
  }
}

all_resource_backend = {
  st_01 = {
    name                     = "tcssct99"
    resource_group_name      = "Home_office"
    location                 = "westus"
    account_tier             = "Standard"
    account_replication_type = "GRS"

    con_name              = "tcscontainer"
    container_access_type = "private"

  }
}

dyanamic_vnet = {
  vnet_01 = {
    name                = "front_door_network"
    location            = "westus"
    resource_group_name = "Home_office"
    address_space       = ["10.0.0.0/16"]
    dns_servers         = ["10.0.0.4", "10.0.0.5"]
    dynamic_vnet_subnet = {
      "subnet1" = {
        subnet_name    = "front_door_subnet_01"
        address_prefix = "10.0.1.0/24"
      }
      "subnet2" = {
        subnet_name    = "front_door_subnet_02"
        address_prefix = "10.0.2.0/24"
      }
    }
  }
}

subnet_12 = {
  snet_01 = {

    name                 = "tcs_subnet_project"
    resource_group_name  = "Home_office"
    virtual_network_name = "tcs_network"
    address_prefixes     = ["10.0.1.0/24"]
  }
  snet_02 = {
    name                 = "tcs_subnet_maintinence"
    resource_group_name  = "Home_office"
    virtual_network_name = "tcs_network"
    address_prefixes     = ["10.0.2.0/24"]
  }
  snet_04 = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "Home_office"
    virtual_network_name = "tcs_network"
    address_prefixes     = ["10.0.3.0/24"]
  }
  snet_03 = {
    name                 = "agw_subnet"
    resource_group_name  = "Home_office"
    virtual_network_name = "tcs_network"
    address_prefixes     = ["10.0.4.0/24"]
  }
}

nic_12 = {
  nic_01 = {
    nic_name                      = "tcs_nic_01"
    location                      = "westus"
    resource_group_name           = "Home_office"
    ip_con_name                   = "ip_con_internal"
    private_ip_address_allocation = "Dynamic"
    subnet_name                   = "tcs_subnet_project"
    virtual_network_name          = "tcs_network"

  }

  nic_02 = {
    nic_name                      = "tcs_nic_02"
    location                      = "westus"
    resource_group_name           = "Home_office"
    ip_con_name                   = "ip_con"
    private_ip_address_allocation = "Dynamic"
    subnet_name                   = "tcs_subnet_project"
    virtual_network_name          = "tcs_network"
  }
}

rgnsg99 = {
  nsg1 = {
    name                = "Security_Group_for_tcs_offical"
    location            = "westus"
    resource_group_name = "Home_office"
  }
}

vnetrg = {
  vnet_01 = {

    name                = "tcs_network"
    resource_group_name = "Home_office"
    address_space       = ["10.0.0.0/16"]
    dns_servers         = ["10.0.0.4", "10.0.0.5"]
    location            = "westus"
  }

  vnet_02 = {

    name                = "tcs_network_peering"
    resource_group_name = "Home_office"
    address_space       = ["10.0.0.0/16"]
    dns_servers         = ["10.0.1.4", "10.0.1.5"]
    location            = "westus"
  }
}



virtual_machine = {
  vm_01 = {

    name                            = "tcsvm01"
    resource_group_name             = "Home_office"
    location                        = "westus"
    size                            = "Standard_F2"
    admin_username                  = "adminuser"
    
    
    caching                         = "ReadWrite"
    publisher                       = "Canonical"
    offer                           = "0001-com-ubuntu-server-jammy"
    sku                             = "22_04-lts"
    version                         = "latest"
    nic_name                        = "tcs_nic_01"
  }

  vm_02 = {

    name                = "tcsvm02"
    resource_group_name = "Home_office"
    location            = "westus"
    size                = "Standard_F2"
    admin_username      = "adminuser"

    disable_password_authentication = false
    caching                         = "ReadWrite"
    storage_account_type            = "Standard_LRS"
    publisher                       = "Canonical"
    offer                           = "0001-com-ubuntu-server-jammy"
    sku                             = "22_04-lts"
    version                         = "latest"
    nic_name                        = "tcs_nic_02"
  }
}

Bastion_host = {
  host = {
    name                = "tcs_bastion_pip"
    location            = "westus"
    resource_group_name = "Home_office"
    allocation_method   = "Static"
    sku                 = "Standard"

    name_host            = "tcs_bastion"
    name_subnet          = "AzureBastionSubnet"
    virtual_network_name = "tcs_network"
    name_ipc             = "ip_con"

  }
}


application_gatway = {
  app_01 = {}
}

# vnet_local = {
#   local_01 = {}
# }