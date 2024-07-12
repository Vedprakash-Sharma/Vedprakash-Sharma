resource "azurerm_public_ip" "tcs_ip" {
  for_each = var.application_gatway
  name                = "agw_tcs_pip"
  resource_group_name = "Home_office"
  location            = "westus"
  allocation_method   = "Static"
  domain_name_label = "vedantabharat"
  sku = "Standard"
}


resource "azurerm_application_gateway" "network" {
  for_each = var.application_gatway
  name                = "tcs_appgateway"
  resource_group_name = "Home_office"
  location            = "westus"
  # firewall_policy_id = ""
  enable_http2 = true
  zones = []

  sku {
    name     = "Standard_v2"
    tier     = "Standard_v2"
    capacity = 2
  }

  gateway_ip_configuration {
    name      = "my-gateway-ip-configuration"
    subnet_id = data.azurerm_subnet.app_subnet[each.key].id
  }

  frontend_port {
    name = "frontend_port_name"
    port = 80
  }
   frontend_port {
    name = "frontend_port"
    port = 443
  }

  frontend_ip_configuration {
    name                 = "frontend_ip_configuration_name"
    public_ip_address_id = azurerm_public_ip.tcs_ip[each.key].id
    # private_ip_address = ""
    # private_ip_address_allocation = ""
    # subnet_id = ""

  }

  backend_address_pool {
    name = "backend_pool_address"
    
    # Add your VM private IP addresses here
    # ip_addresses = ["10.0.1.4", "10.0.1.5"]
    
  }

  backend_http_settings {
    name                  = "http"
    cookie_based_affinity = "Disabled"
    path                  = "/path1/"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 60
    probe_name = "my-probe"
    host_name = "vedantabharat.online"
    # pick_host_name_from_backend_address = true
  }

  http_listener {
    name                           = "listener"
    frontend_ip_configuration_name = "frontend_ip_configuration_name"
    frontend_port_name             = "frontend_port_name"
    protocol                       = "Http"
    host_name = "vedantabharat.online"
    # host_names = ["vedantabharat.online"]
    # firewall_policy_id = ""
  
  }

  request_routing_rule {
    name                       = "routing_rule"
    priority                   = 9
    rule_type                  = "Basic"
    http_listener_name         = "listener"
    backend_address_pool_name  = "backend_pool_address"
    backend_http_settings_name = "http"
    # url_path_map_name = ""
    # rewrite_rule_set_name = ""
    # redirect_configuration_name = ""
    
  }
  probe {
    name = "my-probe"
    host = "vedantabharat.online"
    interval = 30
    protocol = "Http"
    path = "/"
    timeout = 15
    port = 80
    # pick_host_name_from_backend_http_settings = true
    minimum_servers = 2
    unhealthy_threshold = 5
  }

}

resource "azurerm_network_interface_application_gateway_backend_address_pool_association" "pool1" {
  for_each = var.application_gatway
  network_interface_id    = data.azurerm_network_interface.asso_pool01[each.key].id
  ip_configuration_name   = "ip_con_internal"
  backend_address_pool_id = tolist(azurerm_application_gateway.network[each.key].backend_address_pool).0.id
}

resource "azurerm_network_interface_application_gateway_backend_address_pool_association" "pool02" {
  for_each = var.application_gatway
  network_interface_id    = data.azurerm_network_interface.asso_pool02[each.key].id
  ip_configuration_name   = "ip_con"
  backend_address_pool_id = tolist(azurerm_application_gateway.network[each.key].backend_address_pool).0.id
}