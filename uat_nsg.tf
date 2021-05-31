#Create NSG Rules
module "NSG_UAT_DMZ" {
  source                = "./module/terraform-azurerm-network-security-group"
  resource_group_name   = azurerm_resource_group.rg_uat.name
  location              = "southeastasia" #  change to chinaeast2
  security_group_name   = var.nsg_name[0]
  source_address_prefix = ["10.0.3.0/24"]
  custom_rules = [
    {
      name                   = "3-1-1"
      priority               = 110
      direction              = "Inbound"
      access                 = "Allow"
      protocol               = "tcp"
      source_port_range      = "*"
      destination_port_range = "22"
      source_address_prefix  = "10.10.17.200/29"
      destination_address_prefix = "10.10.64.0/24"
      description            = "堡垒机"
    },
    {
      name                    = "3-2-1"
      priority                = 120
      direction               = "Inbound"
      access                  = "Allow"
      protocol                = "tcp"
      source_port_range       = "*"
      #destination_port_range  = ["22,25,199,8080,8443"]
      destination_port_range  = "22,25,199,8080,8443"
      source_address_prefixes = ["10.10.19.0/24"]
      destination_address_prefix = "10.10.64.122"
      description             = "来自AG的MFS应用服务测试"
    },
    {
      name                    = "3-2-2"
      priority                = 130
      direction               = "Inbound"
      access                  = "Allow"
      protocol                = "udp"
      source_port_range       = "*"
      destination_port_range  = "161"
      source_address_prefixes = ["10.10.19.0/24"]
      destination_address_prefix = "10.10.64.122"
      description             = "来自AG的MFS应用服务测试"
    },
    {
      name                    = "3-3-1"
      priority                = 140
      direction               = "Inbound"
      access                  = "Allow"
      protocol                = "tcp"
      source_port_range       = "*"
      destination_port_range  = "22,25,80,443,199"
      source_address_prefixes = ["10.10.19.0/24"]
      destination_address_prefix = "10.10.64.122"
      description             = "来自AG手机进件系统测试应用"
    },
    {
      name                    = "3-3-2"
      priority                = 150
      direction               = "Inbound"
      access                  = "Allow"
      protocol                = "udp"
      source_port_range       = "*"
      destination_port_range  = "161"
      source_address_prefixes = ["10.10.19.0/24"]
      destination_address_prefix = "10.10.64.22"
      description             = "来自AG手机进件系统测试应用"
    },
    {
      name                    = "3-4-1"
      priority                = 160
      direction               = "Inbound"
      access                  = "Allow"
      protocol                = "tcp"
      source_port_range       = "*"
      destination_port_range  = "22,25,199,8080,8443"
      source_address_prefixes = ["10.10.65.0/24"]
      destination_address_prefix = "10.10.64.122"
      description             = "来自UAT内部MFS应用服务测试"
    },
    {
      name                    = "3-4-2"
      description             = "来自UAT内部MFS应用服务测试"
      protocol                = "udp"
      source_port_range       = "*"
      destination_port_range  = "161"
      source_address_prefixes = ["10.10.65.0/24"]
      destination_address_prefix = "10.10.64.122"
      access                  = "Allow"
      priority                = 170
      direction               = "Inbound"     
    },
    {
      name                    = "3-5-1"
      description             = "来自UAT内部手机进件测试应用"
      protocol                = "tcp"
      source_port_range       = "*"
      destination_port_range  = "22,25,80,443,199"
      source_address_prefixes = ["10.10.65.0/24"]
      destination_address_prefix = "10.10.64.22"
      access                  = "Allow"
      priority                = 180
      direction               = "Inbound"     
    },
    {
      name                    = "3-5-2"
      description             = "来自UAT内部手机进件测试应用"
      protocol                = "udp"
      source_port_range       = "*"
      destination_port_range  = "161"
      source_address_prefixes = ["10.10.65.0/24"]
      destination_address_prefix = "10.10.64.22"
      access                  = "Allow"
      priority                = 190
      direction               = "Inbound"     
    },                     
  ]

  depends_on = [azurerm_resource_group.rg_uat]
}


module "NSG_UAT_internal" {
  source                = "./module/terraform-azurerm-network-security-group"
  resource_group_name   = azurerm_resource_group.rg_uat.name
  location              = "southeastasia" #  change to chinaeast2
  security_group_name   = var.nsg_name[1]
  source_address_prefix = ["10.0.3.0/24"]
  custom_rules = [
    {
      name                    = "1-1-1"
      description             = "堡垒机"
      protocol                = "tcp"
      source_port_range       = "*"
      destination_port_range  = "22"
      source_address_prefixes = ["10.10.17.200/29"]
      destination_address_prefix = "10.10.65.0/24"
      access                  = "Allow"
      priority                = 110
      direction               = "Inbound"     
    },
    {
      name                    = "1-2-1"
      description             = "来自DMZ的NMFS应用测试"
      protocol                = "tcp"
      source_port_range       = "*"
      destination_port_range  = "22,25,199,8005,8009,8080,8081,48062"
      source_address_prefixes = ["10.10.64.0/24"]
      destination_address_prefix = "10.10.65.11"
      access                  = "Allow"
      priority                = 120
      direction               = "Inbound"     
    },
    {
      name                    = "1-2-2"
      description             = "来自DMZ的NMFS应用测试"
      protocol                = "udp"
      source_port_range       = "*"
      destination_port_range  = "123,161"
      source_address_prefixes = ["10.10.64.0/24"]
      destination_address_prefix = "10.10.65.11"
      access                  = "Allow"
      priority                = 130
      direction               = "Inbound"     
    },
    {
      name                    = "1-2-3"
      description             = "来自DMZ的NMFS应用测试"
      protocol                = "tcp"
      source_port_range       = "*"
      destination_port_range  = "22,25,111,199,2049,3306,8000,8005,8080,8081,20048,38287,43445,47001,52964"
      source_address_prefixes = ["10.10.64.0/24"]
      destination_address_prefix = "10.10.65.101"
      access                  = "Allow"
      priority                = 140
      direction               = "Inbound"     
    },
    {
      name                    = "1-2-4"
      description             = "来自DMZ的NMFS应用测试"
      protocol                = "tcp"
      source_port_range       = "*"
      destination_port_range  = "111,161,323,982,994,2049,20048,50926,51419,52089,58579"
      source_address_prefixes = ["10.10.64.0/24"]
      destination_address_prefix = "10.10.65.101"
      access                  = "Allow"
      priority                = 150
      direction               = "Inbound"     
    },
    {
      name                    = "1-2-5"
      description             = "来自DMZ的NMFS应用测试"
      protocol                = "tcp"
      source_port_range       = "*"
      destination_port_range  = "22,25,111,199,2049,8005,8009,8080,8081,20048,34889,37170,42012,47786"
      source_address_prefixes = ["10.10.64.0/24"]
      destination_address_prefix = "10.10.65.103"
      access                  = "Allow"
      priority                = 160
      direction               = "Inbound"     
    },
    {
      name                    = "1-2-6"
      description             = "来自DMZ的NMFS应用测试"
      protocol                = "tcp"
      source_port_range       = "*"
      destination_port_range  = "111,161,622,659,2049,20048,36322,36604,51502,60162"
      source_address_prefixes = ["10.10.64.0/24"]
      destination_address_prefix = "10.10.65.103"
      access                  = "Allow"
      priority                = 170
      direction               = "Inbound"     
    },
    {
      name                    = "1-2-7"
      description             = "来自DMZ的NMFS应用测试"
      protocol                = "tcp"
      source_port_range       = "*"
      destination_port_range  = "22,25,111,199,2049,8443,20048,33292,42752,43442,47059,47970"
      source_address_prefixes = ["10.10.64.0/24"]
      destination_address_prefix = "10.10.65.104"
      access                  = "Allow"
      priority                = 180
      direction               = "Inbound"     
    },
    {
      name                    = "1-2-8"
      description             = "来自DMZ的NMFS应用测试"
      protocol                = "udp"
      source_port_range       = "*"
      destination_port_range  = "111,161,745,896,2049,20048,38202,47970,55968,60576"
      source_address_prefixes = ["10.10.64.0/24"]
      destination_address_prefix = "10.10.65.104"
      access                  = "Allow"
      priority                = 190
      direction               = "Inbound"     
    },
    {
      name                    = "1-2-9"
      description             = "来自DMZ的NMFS应用测试"
      protocol                = "tcp"
      source_port_range       = "*"
      destination_port_range  = "22,25,199,8005,8009,8080"
      source_address_prefixes = ["10.10.64.0/24"]
      destination_address_prefix = "10.10.65.111"
      access                  = "Allow"
      priority                = 200
      direction               = "Inbound"     
    },
    {
      name                    = "1-2-10"
      description             = "来自DMZ的NMFS应用测试"
      protocol                = "tcp"
      source_port_range       = "*"
      destination_port_range  = "123,161"
      source_address_prefixes = ["10.10.64.0/24"]
      destination_address_prefix = "10.10.65.111"
      access                  = "Allow"
      priority                = 210
      direction               = "Inbound"     
    },
    {
      name                    = "1-2-11"
      description             = "来自DMZ的NMFS应用测试"
      protocol                = "tcp"
      source_port_range       = "*"
      destination_port_range  = "199,10000,22,25,58504,42698"
      source_address_prefixes = ["10.10.64.0/24"]
      destination_address_prefix = "10.10.65.23"
      access                  = "Allow"
      priority                = 220
      direction               = "Inbound"     
    },
    {
      name                    = "1-3-1"
      description             = "来自DMZ的手机进件系统测试应用"
      protocol                = "tcp"
      source_port_range       = "*"
      destination_port_range  = "25,80,199,9001,3306,8080,8081,8082"
      source_address_prefixes = ["10.10.64.0/24"]
      destination_address_prefix = "10.10.65.22"
      access                  = "Allow"
      priority                = 290
      direction               = "Inbound"     
    },
    {
      name                    = "1-3-2"
      description             = "来自DMZ的手机进件系统测试应用"
      protocol                = "udp"
      source_port_range       = "*"
      destination_port_range  = "123,161"
      source_address_prefixes = ["10.10.64.0/24"]
      destination_address_prefix = "10.10.65.22"
      access                  = "Allow"
      priority                = 300
      direction               = "Inbound"     
    },
    {
      name                    = "1-4-3"
      description             = "数据库从生产环境导出至UAT环境"
      protocol                = "tcp"
      source_port_range       = "*"
      destination_port_range  = "22"
      source_address_prefixes = ["10.10.35.0/24"]
      destination_address_prefix = "10.10.65.0/24"
      access                  = "Allow"
      priority                = 310
      direction               = "Inbound"     
    },
    {
      name                    = "DenyVnetInBound"
      description             = "DenyVnetInBound"
      protocol                = "*"
      source_port_range       = "*"
      destination_port_range  = "*"
      source_address_prefix = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
      access                  = "Deny"
      priority                = 4000
      direction               = "Inbound"     
    },                                                                                                                                                                                                                                                                                                                              
  ]

  depends_on = [azurerm_resource_group.rg_uat]
}

 #Associate nsg to the subnet

resource "azurerm_subnet_network_security_group_association" "asso_dmz" {
  subnet_id                 = module.vnet_uat.vnet_subnets[0]
  network_security_group_id = module.NSG_UAT_DMZ.network_security_group_id
}


resource "azurerm_subnet_network_security_group_association" "asso_int" {
  subnet_id                 = module.vnet_uat.vnet_subnets[1]
  network_security_group_id = module.NSG_UAT_internal.network_security_group_id
}
