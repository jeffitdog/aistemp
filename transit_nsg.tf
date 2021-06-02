module "NSG_Transit_Proxy" {
  source                = "./module/terraform-azurerm-network-security-group"
  resource_group_name   = azurerm_resource_group.rg_transit.name
  location              = "southeastasia" #  change to chinaeast2
  security_group_name   = var.transit_nsg_name[0]
  source_address_prefix = ["10.10.16.0/24"]
  custom_rules = [
    /*
    {
      name                   = "16-1-1"
      priority               = 110
      direction              = "Inbound"    
      access                 = "Allow"
      protocol               = "tcp"
      source_port_range      = "*"
      destination_port_range = "22,111,139,199,445,631,638,2020,8080,8888,32783,32789,32821,55702"   #Add port 65535?
      source_address_prefixes  = ["?????"]         # What is the ip address range of <IP address range of the subnet>
      destination_address_prefix = "10.10.16.0/24"
      description            = "上网接入"
    },

    {
      name                    = "16-1-2"
      priority                = 120
      direction               = "Inbound"
      access                  = "Allow"
      protocol                = "udp"
      source_port_range       = "*"
      #destination_port_range  = ["22,25,199,8080,8443"]
      destination_port_range  = "123,161"
      source_address_prefixes = ["????"]          # What is the ip address range of <IP address range of the subnet>
      destination_address_prefix = "10.10.16.0/24"
      description             = "上网接入"
    },
    */
    {
      name                    = "16-2-1"
      priority                = 130
      direction               = "Inbound"
      access                  = "Allow"
      protocol                = "tcp"
      source_port_range       = "*"
      destination_port_range  = "22"
      source_address_prefixes = ["10.10.17.201"]                
      destination_address_prefix = "10.10.16.0/24"
      description             = "堡垒机"
    },
    {
      name                    = "16-3-1"
      priority                = 140
      direction               = "Inbound"
      access                  = "Allow"
      protocol                = "tcp"
      source_port_range       = "*"
      destination_port_range  = "22,5985,5986"
      source_address_prefixes = ["10.10.50.0/24"]
      destination_address_prefix = "10.10.16.0/24"
      description             = "Ansible"
    },
    
            
  ]

  depends_on = [azurerm_resource_group.rg_transit]
}


module "NSG_Transit_Bastion" {
  source                = "./module/terraform-azurerm-network-security-group"
  resource_group_name   = azurerm_resource_group.rg_transit.name
  location              = "southeastasia" #  change to chinaeast2
  security_group_name   = var.transit_nsg_name[1]
  source_address_prefix = ["10.10.17.0/24"]
  custom_rules = [
    
    {
      name                    = "17-1-1"
      description             = "堡垒机入口"
      protocol                = "tcp"
      source_port_range       = "*"
      destination_port_range  = "443"
      source_address_prefixes = ["172.29.1.0/24","172.29.10.0/24","172.30.30.0/24","192.168.91.0/24","192.168.104.0/24","192.168.107.0/24","192.168.108.0/24","192.168.109.0/24","192.168.110.0/24","172.30.0.0/21","192.168.123.0/24"]             #IP address range of AIS office
      destination_address_prefix = "10.10.17.201"       
      access                  = "Allow"
      priority                = 110
      direction               = "Inbound"     
    },
    
    {
      name                    = "17-2-1"
      description             = "Ansible"
      protocol                = "tcp"
      source_port_range       = "*"
      destination_port_range  = "22,5985,5986"
      source_address_prefixes = ["10.10.50.0/24"]
      destination_address_prefix = "10.10.17.0/24"
      access                  = "Allow"
      priority                = 120
      direction               = "Inbound"     
    },
                                                                                                                                                                                                                                                                                                                     
  ]

  depends_on = [azurerm_resource_group.rg_transit]
}



module "NSG_Transit_Gateway" {
  source                = "./module/terraform-azurerm-network-security-group"
  resource_group_name   = azurerm_resource_group.rg_transit.name
  location              = "southeastasia" #  change to chinaeast2
  security_group_name   = var.transit_nsg_name[2]
  source_address_prefix = ["10.10.18.0/27"] 
  custom_rules = [
    {
      name                    = "18-1-1"
      description             = "ER与VNP网关"
      protocol                = "tcp"
      source_port_range       = "*"
      destination_port_range  = "*"
      source_address_prefix   = "*"
      destination_address_prefix = "10.10.18.0/24"
      access                  = "Allow"
      priority                = 110
      direction               = "Inbound"     
    },
                                                                                                                                                                                                                                                                                                                        
  ]

  depends_on = [azurerm_resource_group.rg_transit]
}

 #Associate nsg to the subnet

resource "azurerm_subnet_network_security_group_association" "asso_transit_proxy" {
  subnet_id                 = module.vnet_transit.vnet_subnets[0]
  network_security_group_id = module.NSG_Transit_Proxy.network_security_group_id
}


resource "azurerm_subnet_network_security_group_association" "asso_transit_bastion" {
  subnet_id                 = module.vnet_transit.vnet_subnets[1]
  network_security_group_id = module.NSG_Transit_Bastion.network_security_group_id
}

resource "azurerm_subnet_network_security_group_association" "asso_transit_gateway" {
  subnet_id                 = module.vnet_transit.vnet_subnets[2]
  network_security_group_id = module.NSG_Transit_Gateway.network_security_group_id
}
