variable "network_security_group_name" {
  type        = string
  description = "The name of the Network Security Group which should be associated with the Subnet. Changing this forces a new resource to be created."
}

variable "subnet_name" {
  description = "The name of the Subnet. Changing this forces a new resource to be created."
}

variable "virtual_network_name" {
  description = "The name of the Virtual Network. Changing this forces a new resource to be created."
}

variable "resource_group_name" {
  description = "The name of the Resource Group. Changing this forces a new resource to be created."
}
