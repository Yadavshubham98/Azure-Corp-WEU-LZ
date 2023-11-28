# # /* IMPORTANT: Run this code ONLY when the following resources are already created
# #       - Azure VM
# #       - Azure Keyvault
# #       - Azure Keyvault keys


module "encrypt-weu-prod-servers-linuxjmp" {
  providers = {
    azurerm = azurerm.weu-management-sub
  }

  source        = "../Modules/Disk-Encryption"
  vm_list       = ["GCPLWEUAZJMP01", "GCPLWEUAZJMP02"]
  vm_rg         = "corp-rg-weu-prod-shared-management-core-jmp"
  keyvault_rg   = "corp-rg-weu-prod-shared-management-akv"
  keyvault_name = "corpakvweupmgmtencrpt-10"
  kek_name      = "vm-key-weu-prod-mgmt-01"
  os_version    = "Linux"

}



module "encrypt-weu-dev-servers-linuxjmp" {
  providers = {
    azurerm = azurerm.weu-management-sub
  }
  source        = "../Modules/Disk-Encryption"
  vm_list       = ["GCDLWEUAZJMP01", "GCDLWEUAZJMP02"]
  vm_rg         = "corp-rg-weu-dev-shared-management-core-jmp"
  keyvault_rg   = "corp-rg-weu-dev-shared-management-akv"
  keyvault_name = "corpakvweudmgmtencrpt-10"
  kek_name      = "vm-key-weu-dev-mgmt-01"
  os_version    = "Linux"
}

module "encrypt-weu-prod-servers-windowsjmp" {
  providers = {
    azurerm = azurerm.weu-management-sub
  }

  source        = "../Modules/Disk-Encryption"
  vm_list       = ["GCPWWEUAZJMP01", "GCPWWEUAZJMP02"]
  vm_rg         = "corp-rg-weu-prod-shared-management-core-jmp"
  keyvault_rg   = "corp-rg-weu-prod-shared-management-akv"
  keyvault_name = "corpakvweupmgmtencrpt-10"
  kek_name      = "vm-key-weu-prod-mgmt-01"
  os_version    = "WindowsServer"

}

module "encrypt-weu-dev-servers-windowsjmp" {
  providers = {
    azurerm = azurerm.weu-management-sub
  }

  source        = "../Modules/Disk-Encryption"
  vm_list       = ["GCDWWEUAZJMP01", "GCDWWEUAZJMP02"]
  vm_rg         = "corp-rg-weu-dev-shared-management-core-jmp"
  keyvault_rg   = "corp-rg-weu-dev-shared-management-akv"
  keyvault_name = "corpakvweudmgmtencrpt-10"
  kek_name      = "vm-key-weu-dev-mgmt-01"
  os_version    = "WindowsServer"

}


module "encrypt-weu-prod-servers-windowslmc" {
  providers = {
    azurerm = azurerm.weu-management-sub
  }
  source        = "../Modules/Disk-Encryption"
  vm_list       = ["GCPWWEUAZLMC01", "GCPWWEUAZLMC02"]
  vm_rg         = "corp-rg-weu-prod-shared-management-core-lmc"
  keyvault_rg   = "corp-rg-weu-prod-shared-management-akv"
  keyvault_name = "corpakvweupmgmtencrpt-10"
  kek_name      = "vm-key-weu-prod-mgmt-01"
  os_version    = "WindowsServer"
}


module "encrypt-weu-dev-servers-windowslmc" {
  providers = {
    azurerm = azurerm.weu-management-sub
  }
  source        = "../Modules/Disk-Encryption"
  vm_list       = ["GCDWWEUAZLMC01"]
  vm_rg         = "corp-rg-weu-dev-shared-management-core-lmc"
  keyvault_rg   = "corp-rg-weu-dev-shared-management-akv"
  keyvault_name = "corpakvweudmgmtencrpt-10"
  kek_name      = "vm-key-weu-dev-mgmt-01"
  os_version    = "WindowsServer"
}


module "encrypt-weu-prod-servers-windowsdc" {
  providers = {
    azurerm = azurerm.weu-identity-sub
  }
  source        = "../Modules/Disk-Encryption"
  vm_list       = ["GCPWWEUAZADC01", "GCPWWEUAZADC02"]
  vm_rg         = "corp-rg-weu-prod-shared-identity-core-adc"
  keyvault_rg   = "corp-rg-weu-prod-shared-identity-akv"
  keyvault_name = "corpakvweupidencrpt-10"
  kek_name      = "vm-key-weu-prod-identity-01"
  os_version    = "WindowsServer"
}


module "encrypt-weu-dev-servers-windowsdc" {
  providers = {
    azurerm = azurerm.weu-identity-sub
  }
  source        = "../Modules/Disk-Encryption"
  vm_list       = ["GCDWWEUAZADC01"]
  vm_rg         = "corp-rg-weu-dev-shared-identity-core-adc"
  keyvault_rg   = "corp-rg-weu-dev-shared-identity-akv"
  keyvault_name = "corpakvweudidencrpt-10"
  kek_name      = "vm-key-weu-dev-identity-01"
  os_version    = "WindowsServer"
}

module "encrypt-weu-prod-servers-windowsokta" {
  providers = {
    azurerm = azurerm.weu-identity-sub
  }

  source        = "../Modules/Disk-Encryption"
  vm_list       = ["GCPWWEUAZOKT01", "GCPWWEUAZOKT02"]
  vm_rg         = "corp-rg-weu-prod-shared-identity-core-okta"
  keyvault_rg   = "corp-rg-weu-prod-shared-identity-akv"
  keyvault_name = "corpakvweupidencrpt-10"
  kek_name      = "vm-key-weu-prod-identity-01"
  os_version    = "WindowsServer"
}



module "encrypt-weu-dev-servers-windowsokta" {
  providers = {
    azurerm = azurerm.weu-identity-sub
  }

  source        = "../Modules/Disk-Encryption"
  vm_list       = ["GCDWWEUAZOKT01"]
  vm_rg         = "corp-rg-weu-dev-shared-identity-core-okta"
  keyvault_rg   = "corp-rg-weu-dev-shared-identity-akv"
  keyvault_name = "corpakvweudidencrpt-10"
  kek_name      = "vm-key-weu-dev-identity-01"
  os_version    = "WindowsServer"
}


