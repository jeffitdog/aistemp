variable "app" {
  type        = string
  description = "App strings affixed to named resources."
}

variable "enable_accelerated_networking" {
  type        = string
  description = "Should Accelerated Networking be enabled? Defaults to false."
  default     = false
}

variable "enable_ip_forwarding" {
  type        = string
  description = "Should IP Forwarding be enabled? Defaults to false."
  default     = false
}

variable "env" {
  type        = string
  description = "The environment for this resource"
}

variable "internal_dns_name_label" {
  type        = string
  description = "The (relative) DNS Name used for internal communications between Virtual Machines in the same Virtual Network."
  default     = null
}

variable "ip_configurations" {
  type = list(object({
    name                          = string
    subnet_id                     = string
    private_ip_address            = string
    private_ip_address_version    = string
    private_ip_address_allocation = string
    public_ip_address_id          = string
    primary                       = string
  }))
  description = "One or more ip_configuration blocks."
  default     = []
}

variable "numberedresource" {
  type        = string
  description = "The number of the resource."
  default     = 0
}

variable "region" {
  type = object({
    name     = string
    nickname = string
  })
  description = "The location/region where the Network Interface is located. Changing the location/region forces a new resource to be created."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the Resource Group in which to create the Network Interface. Changing this forces a new resource to be created."
}

variable "tags" {
  description = "The tags to apply to all resources."
  type        = map
  default     = {}
}