#關於參數的解釋請參閱mgt_nsg.tf 
module "NSG_Transit_Proxy" {
  source                = "./module/terraform-azurerm-network-security-group"
  resource_group_name   = azurerm_resource_group.rg_transit.name
  location              = var.region  
  security_group_name   = var.transit_nsg_name[0]
  #source_address_prefix = ["10.10.16.0/24"]
  source_address_prefix = var.transit_subnet_space[0]
  custom_rules = [
    
    {
      name                   = "16-1-1"
      priority               = 110
      direction              = "Inbound"    
      access                 = "Allow"
      protocol               = "tcp"
      source_port_range      = "*"
      destination_port_range = "22,111,139,199,445,631,638,2020,8080,8888,32783,32789,32821,55702"   #Add port 1208025? this is over 65535
      source_address_prefix = "VirtualNetwork"      
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
      source_address_prefix = "VirtualNetwork"         
      destination_address_prefix = "10.10.16.0/24"
      description             = "上网接入"
    },
    
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
  location              = var.region
  security_group_name   = var.transit_nsg_name[1]
  #source_address_prefix = ["10.10.17.0/24"]
  source_address_prefix = var.transit_subnet_space[1]
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


module "NSG_Transit_AG_DMZ" {
  source                = "./module/terraform-azurerm-network-security-group"
  resource_group_name   = azurerm_resource_group.rg_transit.name
  location              = var.region
  security_group_name   = var.transit_nsg_name[2]
  source_address_prefix = var.transit_subnet_space[2]
  custom_rules = [
    {
      name                    = "5-1-1"
      description             = "DMZ区域访问"
      protocol                = "tcp"
      source_port_range       = "*"
      destination_port_range  = "*"                 #To be Confirmed 
      source_address_prefix   = "10.10.33.122"
      destination_address_prefix = "10.10.19.0/24"
      access                  = "Allow"
      priority                = 110
      direction               = "Inbound"     
    },
    {
      name                    = "5-2-1"
      description             = "DMZ区域访问"
      protocol                = "tcp"
      source_port_range       = "*"
      destination_port_range  = "*"                   #To be Confirmed 
      source_address_prefix   = "*"
      destination_address_prefix = "10.10.33.21"
      access                  = "Allow"
      priority                = 120
      direction               = "Inbound"     
    },
    {
      name                    = "5-2-2"
      description             = "DMZ区域访问"
      protocol                = "tcp"
      source_port_range       = "*"
      destination_port_range  = "*"                   #To be Confirmed 
      source_address_prefix   = "10.10.33.22"
      destination_address_prefix = "10.10.19.0/24"
      access                  = "Allow"
      priority                = 130
      direction               = "Inbound"     
    },
    {
      name                    = "5-3-1"
      description             = "DMZ区域访问"
      protocol                = "tcp"
      source_port_range       = "*"
      destination_port_range  = "*"                   #To be Confirmed 
      source_address_prefix   = "10.10.64.22"
      destination_address_prefix = "10.10.19.0/24"
      access                  = "Allow"
      priority                = 140
      direction               = "Inbound"     
    }, 
    {
      name                    = "5-3-2"
      description             = "DMZ区域访问"
      protocol                = "tcp"
      source_port_range       = "*"
      destination_port_range  = "*"                   #To be Confirmed 
      source_address_prefix   = "10.10.64.122"
      destination_address_prefix = "10.10.19.0/24"
      access                  = "Allow"
      priority                = 150
      direction               = "Inbound"     
    },
    {
      name                    = "5-4-1"
      description             = "DMZ区域访问"
      protocol                = "tcp"
      source_port_range       = "*"
      destination_port_range  = "*"                   #To be Confirmed 
      source_address_prefix   = "10.10.34.81"
      destination_address_prefix = "10.10.19.0/24"
      access                  = "Allow"
      priority                = 160
      direction               = "Inbound"     
    },
    {
      name                    = "5-5-1"
      description             = "外部接入"
      protocol                = "tcp"
      source_port_range       = "*"
      destination_port_range  = "*"                      #To be Confirmed 
      source_address_prefix   = "*"
      destination_address_prefix = "10.10.19.0/24"
      access                  = "Allow"
      priority                = 170
      direction               = "Inbound"     
    },
    {
      name                    = "5-6-1"
      description             = "Ansible"
      protocol                = "tcp"
      source_port_range       = "*"
      destination_port_range  = "22,5985,5986"
      source_address_prefix   = "10.10.50.1"
      destination_address_prefix = "10.10.19.0/24"
      access                  = "Allow"
      priority                = 180
      direction               = "Inbound"     
    },
    {
      name                    = "5-7-1"
      description             = "监视业务"
      protocol                = "udp"
      source_port_range       = "*"
      destination_port_range  = "161"
      source_address_prefix   = "10.10.48.14"
      destination_address_prefix = "10.10.19.0/24"
      access                  = "Allow"
      priority                = 190
      direction               = "Inbound"     
    },                                                                                                                                                                                                                                                                                                                                                                           
  ]

  depends_on = [azurerm_resource_group.rg_transit]
}

module "NSG_Transit_Operation" {
  source                = "./module/terraform-azurerm-network-security-group"
  resource_group_name   = azurerm_resource_group.rg_transit.name
  location              = var.region
  security_group_name   = var.transit_nsg_name[3]
  #source_address_prefix = ["10.10.18.0/27"]
  source_address_prefix = var.transit_subnet_space[3]
  custom_rules = [
    {
      name                    = "19-1-1"
      description             = "堡垒机"
      protocol                = "tcp"
      source_port_range       = "*"
      destination_port_range  = "3389"
      source_address_prefix   = "10.10.17.201"
      destination_address_prefix = "10.10.18.0/24"
      access                  = "Allow"
      priority                = 110
      direction               = "Inbound"     
    },
    {
      name                    = "19-2-1"
      description             = "AD相关服务"
      protocol                = "tcp"
      source_port_range       = "*"
      destination_port_range  = "49152-49158,53,80,88,135,55577,139,445,464,593,636,3268,3269,3389,5985,9389,10000,32388,33875,55054,47001,49198,49199,49230,49232,51417"
      source_address_prefixes = concat(var.amf_office_ip_address,var.ais_office_ip_address,var.windows_ip_address)
      destination_address_prefixes = var.windows_ad_ip_address
      access                  = "Allow"
      priority                = 120
      direction               = "Inbound"     
    },
      {
      name                    = "19-3-1"
      description             = "AD相关服务"
      protocol                = "udp"
      source_port_range       = "*"
      destination_port_range  = "53,123,137,138,161,389,464,500,3389,4500,5355"
      source_address_prefixes = concat(var.amf_office_ip_address,var.ais_office_ip_address,var.windows_ip_address)
      destination_address_prefixes = var.windows_ad_ip_address
      access                  = "Allow"
      priority                = 130
      direction               = "Inbound"     
    },
    {
      name                    = "19-4-1"
      description             = "趋势服务器"
      protocol                = "tcp"
      source_port_range       = "*"
      destination_port_range  = "*"                      #To be confirmed
      source_address_prefix   = "10.10.48.233"
      destination_address_prefix = "10.10.18.0/24"
      access                  = "Allow"
      priority                = 140
      direction               = "Inbound"     
    },
    {
      name                    = "19-5-1"
      description             = "监视业务"
      protocol                = "udp"
      source_port_range       = "*"
      destination_port_range  = "161"
      source_address_prefix   = "10.10.48.14"
      destination_address_prefix = "10.10.18.0/24"
      access                  = "Allow"
      priority                = 150
      direction               = "Inbound"     
    },
    {
      name                    = "19-6-1"
      description             = "Ansible"
      protocol                = "tcp"
      source_port_range       = "*"
      destination_port_range  = "22,5985,5986"
      source_address_prefix   = "10.10.50.1"
      destination_address_prefix = "10.10.18.0/24"
      access                  = "Allow"
      priority                = 160
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

resource "azurerm_subnet_network_security_group_association" "asso_transit_ag_dmz" {
  subnet_id                 = module.vnet_transit.vnet_subnets[2]
  network_security_group_id = module.NSG_Transit_AG_DMZ.network_security_group_id
}

resource "azurerm_subnet_network_security_group_association" "asso_transit_operation" {
  subnet_id                 = module.vnet_transit.vnet_subnets[3]
  network_security_group_id = module.NSG_Transit_Operation.network_security_group_id
}