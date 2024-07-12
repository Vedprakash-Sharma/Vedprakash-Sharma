rg_12 = {
  rg_01 = {
    name     = "hcl_offical"
    location = "Westeurope"
  }
  rg_02 = {
    name     = "hcl_office"
    location = "eastus"
  }

}

all_resource_backend = {
  st_01 = {
    name                     = "hclsct"
    resource_group_name      = "hcl_offical"
    location                 = "Westeurope"
    account_tier             = "Standard"
    account_replication_type = "GRS"

    con_name              = "hclcontainer"
    container_access_type = "private"

  }
}

dyanamic_vnet = {
  vnet_01 = {
    name                = "front_door_network"
    location            = "Westeurope"
    resource_group_name = "hcl_offical"
    address_space       = ["10.0.0.0/16"]
    dns_servers         = ["10.0.0.4", "10.0.0.5"]
    dynamic_vnet_subnet = {
      "subnet1" = {
        subnet_name    = "front_door_subnet_04"
        address_prefix = "10.0.1.0/24"
      }
      "subnet2" = {
        subnet_name    = "front_door_subnet_05"
        address_prefix = "10.0.2.0/24"
      }
    }
  }
}

subnet_12 = {
  snet_01 = {

    name                 = "hcl_subnet_project"
    resource_group_name  = "hcl_offical"
    virtual_network_name = "hcl_network"
    address_prefixes     = ["10.0.1.0/24"]
  }
  snet_02 = {
    name                 = "hcl_subnet_maintinence"
    resource_group_name  = "hcl_offical"
    virtual_network_name = "hcl_network"
    address_prefixes     = ["10.0.2.0/24"]
  }
  snet_04 = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "hcl_offical"
    virtual_network_name = "hcl_network"
    address_prefixes     = ["10.0.3.0/24"]
  }
  snet_03 = {
    name                 = "agw_subnet01"
    resource_group_name  = "hcl_offical"
    virtual_network_name = "hcl_network"
    address_prefixes     = ["10.0.4.0/24"]
  }
}

nic_12 = {
  nic_01 = {
    nic_name                      = "hcl_nic_01"
    location                      = "Westeurope"
    resource_group_name           = "hcl_offical"
    ip_con_name                   = "ip_con_internal"
    private_ip_address_allocation = "Dynamic"
    subnet_name                   = "hcl_subnet_project"
    virtual_network_name          = "hcl_network"

  }

  nic_02 = {
    nic_name                      = "hcl_nic_02"
    location                      = "Westeurope"
    resource_group_name           = "hcl_offical"
    ip_con_name                   = "ip_con"
    private_ip_address_allocation = "Dynamic"
    subnet_name                   = "hcl_subnet_project"
    virtual_network_name          = "hcl_network"
  }
}

rgnsg99 = {
  nsg1 = {
    name                = "Security_Group_for_hcl_offical"
    location            = "Westeurope"
    resource_group_name = "hcl_offical"
  }
}

vnetrg = {
  vnet_01 = {

    name                = "hcl_network"
    resource_group_name = "hcl_offical"
    address_space       = ["10.0.0.0/16"]
    dns_servers         = ["10.0.0.4", "10.0.0.5"]
    location            = "Westeurope"

  }

}