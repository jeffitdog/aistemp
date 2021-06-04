
resource "azurerm_resource_group" "erg_rg" {                   #建立屬於ExpressRoute的資源組
  name     = var.erg_rg
  location = var.region
}

resource "azurerm_public_ip" "erg_pip" {                            #建立Public IP address
  name                = "ERGW_GIP"
  location            = azurerm_resource_group.erg_rg.location
  resource_group_name = azurerm_resource_group.erg_rg.name

  allocation_method = "Dynamic"
}

resource "azurerm_virtual_network_gateway" "VPNGateway" {
  name                = "ERGW"
  location            = var.region 
  resource_group_name = var.transit_rg_name

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



resource "azurerm_express_route_circuit" "example" {
  name                  = "expressRoute1"
  resource_group_name   = azurerm_resource_group.erg_rg.name
  location              = azurerm_resource_group.erg_rg.location
  service_provider_name = "Equinix"
  peering_location      = "Silicon Valley"
  bandwidth_in_mbps     = 50

  sku {
    tier   = "Standard"
    family = "UnlimitedData"
  }

  tags = {
    environment = "Production"
  }
}


/*
resource "azurerm_virtual_network_gateway_connection" "expressroutecircuit" {
  name                = "expressroutecircuit"
  location            = azurerm_resource_group.erg_rg.location
  resource_group_name = azurerm_resource_group.erg_rg.name

  type                       = "ExpressRoute"
  virtual_network_gateway_id = azurerm_virtual_network_gateway.VPNGateway.id
  express_route_circuit_id   = azurerm_local_network_gateway.onpremise.id

  #shared_key = "4-v3ry-53cr37-1p53c-5h4r3d-k3y"
}

*/