module "NSG-UAT-DMZ" {
  source                = "./module/terraform-azurerm-network-security-group"
  resource_group_name   = azurerm_resource_group.rg_uat.name
  location              = "southeastasia" #  change to chinaeast2
  security_group_name   = "NSG-UAT-DMZ"
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
  ]

  tags = {
    environment = "dev"
    costcenter  = "it"
  }

  depends_on = [azurerm_resource_group.rg_uat]
}