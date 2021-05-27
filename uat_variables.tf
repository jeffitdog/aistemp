variable "rg_name" {
  type    = any
  default = "RG-UAT-10"
}

variable "vnet_name" {
  type    = any
  default = "VNT-UAT-10"
}

variable "subnet_name" {
  type    = any
  default = ["SNT-UAT-DMZ-64", "SNT-UAT-internal-65"]
}

variable "nsg_name" {
  type    = any
  default = ["NSG-UAT-DMZ", "NSG-UAT-internal"]
}