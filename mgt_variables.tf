variable "mgt_vnet_name" {
  type    = any
  default = "VNT-Management-10"
}

variable "mgt_subnet_name" {
  type    = any
  default = ["SNT-Management-Security-48", "SNT-Management-Admin-49","SNT-Management-Migratement-50"]
}

variable "mgt_nsg_name" {
  type    = any
  default = ["NSG-SNT-Management-Security-48","NSG-SNT-Management-Admin-49", "NSG-SNT-Management-Migratement-50"]
}

variable "mgt_vnet_space" {
  type    = any
  default = ["10.10.48.0/20"]
}

variable "mgt_subnet_space" {
  type    = any
  default = ["10.10.48.0/24", "10.10.49.0/24","10.10.50.0/24"]
}

variable "mgt_enable_accelerated_networking" {
  type    = any
  default = "true"
}