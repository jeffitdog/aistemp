variable "transit_vnet_name" {
  type    = any
  default = "VNT-Transit-10"
}

variable "transit_subnet_name" {
  type    = any
  default = ["SNT-Transit-Proxy-16", "SNT-Transit-Bastion-17"]
}

variable "transit_nsg_name" {
  type    = any
  default = ["NSG-Tranist-Proxy", "NSG-Transit-Bastion"]
}

variable "transit_vnet_space" {
  type    = any
  default = ["10.10.16.0/20"]
}

variable "transit_subnet_space" {
  type    = any
  default = ["10.10.16.0/24", "10.10.17.0/24"]
}

variable "transit_enable_accelerated_networking" {
  type    = any
  default = "true"
}