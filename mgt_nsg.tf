module "NSG_MGT_Security" {
  source                = "./module/terraform-azurerm-network-security-group"
  resource_group_name   = azurerm_resource_group.rg_mgt.name
  location              = "southeastasia" #  change to chinaeast2
  security_group_name   = var.mgt_nsg_name[0]
  source_address_prefix = ["10.10.48.0/24"]
  custom_rules = [
    /*  
    {
      name                   = "15-1-1"
      priority               = 110
      direction              = "Inbound"    
      access                 = "Allow"
      protocol               = "tcp"
      source_port_range      = "*"
      destination_port_range = "3389"
      source_address_prefixes  = ["10.10.17.201","10.10.17.202","10.10.17.203","10.10.17.204","10.10.17.205","10.10.17.206","10.10.17.207","10.10.17.208"]
      destination_address_prefix = "10.10.48.0/24"
      description            = "堡垒机"
    },
    */
   /*
    {
      name                    = "15-2-1"
      priority                = 120
      direction               = "Inbound"
      access                  = "Allow"
      protocol                = "tcp"
      source_port_range       = "*"
      #destination_port_range  = ["22,25,199,8080,8443"]
      destination_port_range  = "80,8080,443"
      source_address_prefixes = ["????"]
      destination_address_prefix = "10.10.48.233"
      description             = "杀毒软件服务器预留"
    },
    
    {
      name                    = "15-3-1"
      priority                = 130
      direction               = "Inbound"
      access                  = "Allow"
      protocol                = "tcp"
      source_port_range       = "*"
      destination_port_range  = "135,139,445,3389"
      source_address_prefixes = ["????"]
      destination_address_prefix = "10.10.48.2"
      description             = "访问IPGUARD"
    },
    {
      name                    = "15-4-1"
      priority                = 140
      direction               = "Inbound"
      access                  = "Allow"
      protocol                = "tcp"
      source_port_range       = "*"
      destination_port_range  = "80,443,2196,2195"
      source_address_prefixes = ["10.10.19.0/24"]
      destination_address_prefix = "????"
      description             = "访问AIRWATCH"
    },
    */
    {
      name                    = "15-5-1"
      priority                = 150
      direction               = "Inbound"
      access                  = "Allow"
      protocol                = "tcp"
      source_port_range       = "*"
      destination_port_range  = "22,5985,5986"
      source_address_prefixes = ["10.10.50.1"]
      destination_address_prefix = "10.10.48.0/24"
      description             = "Ansible"
    },
             
  ]

  depends_on = [azurerm_resource_group.rg_mgt]
}


module "NSG_MGT_Admin" {
  source                = "./module/terraform-azurerm-network-security-group"
  resource_group_name   = azurerm_resource_group.rg_mgt.name
  location              = "southeastasia" #  change to chinaeast2
  security_group_name   = var.mgt_nsg_name[1]
  source_address_prefix = ["10.10.49.0/24"]
  custom_rules = [
    {
      name                    = "2-1-1"
      description             = "堡垒机"
      protocol                = "tcp"
      source_port_range       = "*"
      destination_port_range  = "3389"
      source_address_prefixes = ["10.10.17.200/29"]
      destination_address_prefix = "10.10.65.0/24"
      access                  = "Allow"
      priority                = 110
      direction               = "Inbound"     
    },
    {
      name                    = "2-2-1"
      description             = "WSUS服务"
      protocol                = "tcp"
      source_port_range       = "*"
      destination_port_range  = "8530,8531"
      source_address_prefixes = ["10.10.64.0/24"]
      destination_address_prefix = "10.10.65.11"
      access                  = "Allow"
      priority                = 120
      direction               = "Inbound"     
    },
    {
      name                    = "2-3-1"
      description             = "KMS服务"
      protocol                = "udp"
      source_port_range       = "*"
      destination_port_range  = "1688"
      source_address_prefixes = ["10.10.64.0/24"]
      destination_address_prefix = "10.10.65.11"
      access                  = "Allow"
      priority                = 130
      direction               = "Inbound"     
    },
    /*
    {
      name                    = "2-4-1"
      description             = "AD相关服务"
      protocol                = "tcp"
      source_port_range       = "*"
      destination_port_range  = "49152-49158,53,80,88,135,55577,139,445,464,593,636,3268,3269,3389,5985,9389,10000,32388,33875,55054,47001,49198,49199,49230,49232,51417"
      source_address_prefixes = ["1?????"]
      destination_address_prefix = "10.10.65.101"
      access                  = "Allow"
      priority                = 140
      direction               = "Inbound"     
    },
        {
      name                    = "2-4-2"
      description             = "AD相关服务"
      protocol                = "udp"
      source_port_range       = "*"
      destination_port_range  = "53,123,137,138,161,389,464,500,3389,4500,5355"
      source_address_prefixes = ["1?????"]
      destination_address_prefix = "????"
      access                  = "Allow"
      priority                = 150
      direction               = "Inbound"     
    },
    */
    {
      name                    = "2-5-1"
      description             = "文件服务器"
      protocol                = "*"
      source_port_range       = "*"
      destination_port_range  = "135,139,445,3389,10000"
      source_address_prefix   = ["*"]
      destination_address_prefix = "10.10.49.10"
      access                  = "Allow" 
      priority                = 160
      direction               = "Inbound"     
    },
    /*
    {
      name                    = "2-6-1"
      description             = "ADFS"
      protocol                = "tcp"
      source_port_range       = "*"
      destination_port_range  = "80,135,139,443,445,808"
      source_address_prefixes = ["????"]
      destination_address_prefix = ["10.10.49.51","10.10.49.52"]
      access                  = "Allow"
      priority                = 170
      direction               = "Inbound"     
    },
    
    {
      name                    = "2-7-1"
      description             = "趋势服务器"
      protocol                = "tcp"
      source_port_range       = "*"
      destination_port_range  = "??????"
      source_address_prefixes = ["10.10.48.233"]
      destination_address_prefix = "10.10.49.0/24"
      access                  = "Allow"
      priority                = 180
      direction               = "Inbound"    
    },
    */
    {
      name                    = "2-8-1"
      description             = "Ansible"
      protocol                = "tcp"
      source_port_range       = "*"
      destination_port_range  = "22,5985,5986"
      source_address_prefixes = ["10.10.50.0/24"]
      destination_address_prefix = "10.10.49.0/24"
      access                  = "Allow"
      priority                = 190
      direction               = "Inbound"     
    },
                                                                                                                                                                                                                                                                                                                     
  ]

  depends_on = [azurerm_resource_group.rg_uat]
}


 #Associate nsg to the subnet
/*
resource "azurerm_subnet_network_security_group_association" "asso_dmz" {
  subnet_id                 = module.vnet_uat.vnet_subnets[0]
  network_security_group_id = module.NSG_UAT_DMZ.network_security_group_id
}


resource "azurerm_subnet_network_security_group_association" "asso_int" {
  subnet_id                 = module.vnet_uat.vnet_subnets[1]
  network_security_group_id = module.NSG_UAT_internal.network_security_group_id
}
*/