variable "transit_rg_name" {          #資源組名字
  type    = any
  default = "RSG-Transit-10"
}

variable "transit_vnet_name" {          #VNET名字
  type    = any
  default = "VNT-Transit-10"
}

variable "transit_subnet_name" {        #Subnet名字
  type    = any
  default = ["SNT-Transit-Proxy-16","NSG-SNT-Transit-Bastion-17","SNT-Transit-AG-DMZ-19","SNT-Transit-Operation-20","GatewaySubnet"]       
}

variable "transit_nsg_name" {           #NSG名字  
  type    = any
  default = ["NSG-Transit-Proxy","NSG-Transit-Bastion","NSG-Transit-AG-DMZ","NSG-Transit-Operation"]         
}

variable "transit_vnet_space" {           #VNET網絡位置範圍
  type    = any
  default = ["10.10.16.0/20"]
}

variable "transit_subnet_space" {         #SUBNET網絡位置範圍
  type    = any
  default = ["10.10.16.0/24", "10.10.17.0/24","10.10.19.0/24","10.10.20.0/24","10.10.31.224/27"]
}

variable "transit_enable_accelerated_networking" {          #是否啟動網絡加速      
  type    = any
  default = "true"
}


variable "admin_password" {          #是否啟動網絡加速      
  type    = any
  default = "true"
}