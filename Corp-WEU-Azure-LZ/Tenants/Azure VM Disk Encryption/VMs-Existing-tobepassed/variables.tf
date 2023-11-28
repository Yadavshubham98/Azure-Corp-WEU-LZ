variable "tenant_id" {
  type = string
}

variable "vm_password" {
  type      = string
  default   = ""
  sensitive = true
}

variable "prefix" {
  type    = string
  default = "corp"
}

variable "location-ind" {
  type    = string
  default = "centralindia"
}

variable "location-weu" {
  type    = string
  default = "westeurope"
}

variable "location-eus" {
  type    = string
  default = "eastus"
}

variable "location-wus" {
  type    = string
  default = "westus"
}

variable "vm_prod_size" {
  type    = string
  default = "Standard_D2s_v3"
}

variable "vm_dev_size" {
  type    = string
  default = "Standard_D2s_v3"
}

variable "vm_os_linux_publisher" {
  type    = string
  default = "OpenLogic"
}

variable "vm_os_linux_offer" {
  type    = string
  default = "CentOs"
}

variable "vm_os_linux_sku" {
  type    = string
  default = "7.6"
}

variable "vm_os_windows_publisher" {
  type    = string
  default = "MicrosoftWindowsServer"
}

variable "vm_os_windows_offer" {
  type    = string
  default = "WindowsServer"
}

variable "vm_os_windows_sku" {
  type    = string
  default = "2019-Datacenter"
}

variable "vm_os_ad_windows_sku" {
  type    = string
  default = "2016-Datacenter"
}
variable "vm_os_linux_zscaler_publisher" {
  type    = string
  default = "zscaler"
}

variable "vm_os_linux_zscaler_offer" {
  type    = string
  default = "zscaler-private-access"
}

variable "vm_os_linux_zscaler_sku" {
  type    = string
  default = "zpa-con-azure"
}

variable "diagnostic_sa" {
  type    = string
  default = ""
}

variable "nb_instance" {
  type        = number
  default     = 1
  description = "The number of keys to be created"
}

variable "server_name" {
  type        = list(any)
  default     = [""]
  description = "List of server keys to be created"
}

variable "key_vault_id" {
  type        = string
  default     = ""
  description = "key vault id of the key vault resource"
}

variable "key_type" {
  type        = string
  default     = ""
  description = "encryption key type"
}

variable "key_size" {
  type        = string
  default     = ""
  description = "encryption key size"
}

variable "vm_names" {
  type    = list(any)
  default = []
}

variable "managed_identity_principal_id" {
  type    = string
  default = ""
}

variable "keyvault_admin_upn" {
  type    = string
  default = ""
}







variable "rsv_rg" {
  type    = string
  default = ""
}


variable "rsv_name" {
  type    = string
  default = ""
}


variable "backup_policy_ide" {
  type    = string
  default = ""
}





variable "backup_policy_id" {
  type    = string
  default = ""
}


variable "keyvault_name" {
  type    = string
  default = ""



}



variable "keyvault_rg" {
  type    = string
  default = ""



}

variable "vm_encrypt_url_kv_key_url" {

  type    = string
  default = ""
}


variable "vm_list" {
  type    = list(any)
  default = [""]

}

variable "zone" {
  type    = string
  default = ""
}

variable "os_version" {
  type    = string
  default = ""
}



variable "kek_name" {
  type    = string
  default = ""
}