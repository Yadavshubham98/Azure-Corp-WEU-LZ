variable "nb_instance"{
    type = number
    default = 1
    description = "The number of keys to be created"
}

variable "server_name"{
    type = string
    default = ""
    description = "List of server keys to be created"
}

variable "key_vault_id"{
    type = string
    default = ""
    description = "key vault id of the key vault resource"
}

variable "key_type"{
    type = string
    default = ""
    description = "encryption key type"
}

variable "key_size"{
    type = string
    default = ""
    description = "encryption key size"
}

variable "deploy_key_vault_keys"{
  type = bool
  default = false
} 

