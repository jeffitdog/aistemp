variable "transit_rg_name" {          #資源組名字
  type    = any
  default = "RG-Transit-10"
}

variable "transit_vnet_name" {          #VNET名字
  type    = any
  default = "VNT-Transit-10"
}

variable "transit_subnet_name" {        #Subnet名字
  type    = any
  default = ["SNT-Transit-Proxy-16","NSG-SNT-Transit-Bastion-17","SNT-Transit-Gateway-18","SNT-Transit-AG-DMZ-19"]
}

variable "transit_nsg_name" {           #NSG名字
  type    = any
  default = ["NSG-Transit-Proxy-16","NSG-Transit-Bastion-17","NSG-Transit-Gateway-18","NSG-Transit-AG-DMZ-19"]
}

variable "transit_vnet_space" {           #VNET網絡位置範圍
  type    = any
  default = ["10.10.16.0/20"]
}

variable "transit_subnet_space" {         #SUBNET網絡位置範圍
  type    = any
  default = ["10.10.16.0/24", "10.10.17.0/24","10.10.18.0/27","10.10.19.0/24"]
}

variable "transit_enable_accelerated_networking" {          #是否啟動網絡加速      
  type    = any
  default = "true"
}