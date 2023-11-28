
variable "keyvault_name"{
  type = string
  default = ""
}
variable "keyvault_rg"{
  type = string
  default = ""
}
variable "vm_encrypt_url_kv_key_url" {

  type    = string
  default = ""
}


variable "vm_list"{
  type = list
  default = [""]
}

variable "vm_rg"{
  type = string
  default = ""
}


variable "os_version"{
  type = string
  default = ""
}


variable "kek_name"{

type = string
default = ""
}