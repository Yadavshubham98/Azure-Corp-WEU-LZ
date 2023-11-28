

variable "rsv_rg"{
  type = string
  default = ""
}


variable "rsv_name"{
  type = string
  default = ""
}


variable "backup_policy_id"{
  type = string
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



variable "os_version" {
   type = string
  default = ""
}