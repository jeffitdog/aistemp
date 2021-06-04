/*
resource "azurerm_resource_group" "example" {
  name     = var.erg_rg
  location = var.region
}

resource "azurerm_virtual_network" "example" {
  name                = "test"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  address_space       = ["192.0.0.0/16"]
}

resource "azurerm_subnet" "example" {
  name                 = "GatewaySubnet"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["192.0.1.0/27"]
}
*/
resource "azurerm_public_ip" "erg_pip" {
  name                = "ERGW_GIP"
  location            = var.region
  resource_group_name = var.erg_rg

  allocation_method = "Dynamic"
}

resource "azurerm_virtual_network_gateway" "example" {
  name                = "ERGW"
  location            = var.region 
  resource_group_name = var.erg_rg

  type     = "ExpressRoute"
  vpn_type = "PolicyBased"

  active_active = false
  enable_bgp    = false
  sku           = "Standard"

  ip_configuration {
    name                          = "vnetGatewayConfig"
    public_ip_address_id          = azurerm_public_ip.erg_pip.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = module.vnet_transit.vnet_subnets[4]
  }
}


