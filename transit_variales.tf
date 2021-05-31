variable "transit_rg_name" {
  type    = any
  default = "RG-Transit-10"
}

variable "transit_vnet_name" {
  type    = any
  default = "VNT-Transit-10"
}

variable "transit_subnet_name" {
  type    = any
  default = ["SNT-Transit-AG-DMZ-19","SNT-Transit-Proxy-16","NSG-SNT-Transit-Bastion-17","SNT-Transit-Gateway-18"]
}

variable "transit_nsg_name" {
  type    = any
  default = ["NSG-Transit-AG-DMZ-19","NSG-Transit-Proxy-16","NSG-Transit-Bastion-17","NSG-Transit-Gateway-18"]
}

variable "transit_vnet_space" {
  type    = any
  default = ["10.10.16.0/20"]
}

variable "transit_subnet_space" {
  type    = any
  default = ["10.10.19.0/24","10.10.16.0/24", "10.10.17.0/24","10.10.18.0/27"]
}

variable "transit_enable_accelerated_networking" {
  type    = any
  default = "true"
}