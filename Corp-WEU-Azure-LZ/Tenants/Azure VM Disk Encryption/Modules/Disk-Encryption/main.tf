
data "azurerm_key_vault_key" "get-kek"{

  name = var.kek_name
  key_vault_id = data.azurerm_key_vault.keyvault.id
}



data "azurerm_key_vault" "keyvault"{

    name = var.keyvault_name
    resource_group_name = var.keyvault_rg
}

data "azurerm_virtual_machine" "get-vm-name"{
  count =length(var.vm_list)
  name = element(var.vm_list,count.index)
  resource_group_name = var.vm_rg
}


resource "azurerm_virtual_machine_extension" "vm_encry_win" {
  count                         = (var.os_version == "WindowsServer") ? length(var.vm_list) : 0
  name                          = "AzureDiskEncryption"
  virtual_machine_id          = data.azurerm_virtual_machine.get-vm-name[count.index].id
  publisher                     = "Microsoft.Azure.Security"
  type                          = "AzureDiskEncryption"
  type_handler_version          = "2.2"
    auto_upgrade_minor_version = true

//${var.vm_encrypt_url_kv_key_url}"
  settings = <<SETTINGS
                {
                    "EncryptionOperation": "EnableEncryption",
                    "KeyVaultURL":              "${data.azurerm_key_vault.keyvault.vault_uri}",
                    "KeyVaultResourceId":       "${data.azurerm_key_vault.keyvault.id}",
                    "KeyEncryptionKeyURL":      "https://${var.keyvault_name}.vault.azure.net/keys/${var.kek_name}/${data.azurerm_key_vault_key.get-kek.version}",
                    "KekVaultResourceId":       "${data.azurerm_key_vault.keyvault.id}",
                    "KeyEncryptionAlgorithm":   "RSA-OAEP",
                    "VolumeType":               "ALL"
                }
             SETTINGS

   lifecycle {
    prevent_destroy = true
    ignore_changes = [ tags, ]
  }             
}


resource "azurerm_virtual_machine_extension" "vm_encry_linux" {
count                         = (var.os_version != "WindowsServer") ? length(var.vm_list) : 0
  name                          = "AzureDiskEncryption"
  virtual_machine_id          = data.azurerm_virtual_machine.get-vm-name[count.index].id
  publisher                     = "Microsoft.Azure.Security"
  type                          = "AzureDiskEncryptionForLinux"
  type_handler_version          = "1.1"
    auto_upgrade_minor_version = true


  settings = <<SETTINGS
                {
                    "EncryptionOperation": "EnableEncryption",
                    "KeyVaultURL":              "${data.azurerm_key_vault.keyvault.vault_uri}",
                    "KeyVaultResourceId":       "${data.azurerm_key_vault.keyvault.id}",
                    "KeyEncryptionKeyURL":      "https://${var.keyvault_name}.vault.azure.net/keys/${var.kek_name}/${data.azurerm_key_vault_key.get-kek.version}",
                    "KekVaultResourceId":       "${data.azurerm_key_vault.keyvault.id}",
                    "KeyEncryptionAlgorithm":   "RSA-OAEP",
                    "VolumeType":               "ALL"
                }
             SETTINGS
          
  lifecycle {
    prevent_destroy = true
    ignore_changes = [ 
      tags,
       ]
  }        
}

