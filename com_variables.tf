variable "ais_office_ip_address" {                 #AIS Office IPI 地址
  type    = list(string)
  default = ["192.168.91.0/24","192.168.104.0/24","192.168.107.0/24","192.168.108.0/24","192.168.109.0/24","192.168.110.0/24","172.30.0.0/21","192.168.123.0/24"]  
}

variable "amf_office_ip_address" {                  #AMF Office IP 地址
  type    = list(string)
  default = ["172.29.1.0/24","172.29.10.0/24","172.30.30.0/24"]  
}


variable "windows_ad_ip_address" {                   #Windows AD Server 地址
  type    = list(string)
  default = ["10.10.49.45","10.10.49.46","10.10.49.47"]  
}

variable "windows_ip_address" {                       #Windows IP 地址
  type    = list(string)
  default = ["10.10.49.10","10.10.49.45","10.10.49.46","10.10.49.47","10.10.50.2","10.10.20.1","10.10.37.127","10.10.38.126","10.10.38.89","10.10.36.82","10.10.36.81","10.10.34.81","10.10.48.1","10.10.48.2","10.10.49.51","10.10.49.52","10.10.48.233","10.10.39.71","10.10.49.234","10.10.49.232","10.10.40.1","10.10.40.2"]  
}

variable "region" {                       #資源所屬地區
  type    = string
  default = "southeastasia"                #Change to chinaeast2
}

variable "erg_rg" {                       #ExpressRoute 所屬資源組
  type    = string
  default = "ExpressRouteRG"                 
}
