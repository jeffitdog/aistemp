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
  default = ["NSG-SNT-UAT-DMZ", "NSG-SNT-UAT-internal"]
}

variable "vnet_space" {
  type    = any
  default = ["10.10.64.0/20"]
}

variable "subnet_space" {
  type    = any
  default = ["10.10.64.0/24", "10.10.65.0/24"]
}

variable "enable_accelerated_networking" {
  type    = any
  default = "true"
}

