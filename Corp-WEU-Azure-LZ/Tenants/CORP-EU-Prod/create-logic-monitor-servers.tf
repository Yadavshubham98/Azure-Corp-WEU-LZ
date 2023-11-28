
# //weu
# //weu Prod LMC

module "corp-rg-weu-prod-shared-management-logicmonitor-servers" {
  providers = {
    azurerm = azurerm.weu-management-sub
  }
  source                           = "../../Modules/Create-Vms"
  resource_group_name              = azurerm_resource_group.weu-lmc-rgs[0].name
  vm_hostname                      = "GCPWWEUAZLMC"
  vm_size                          = var.vm_prod_size
  vm_os_publisher                  = var.vm_os_windows_publisher
  vm_os_offer                      = var.vm_os_windows_offer
  vm_os_sku                        = var.vm_os_windows_sku
  vnet_subnet_id                   = azurerm_subnet.corp-weu-prod-management-subnet[0].id
  enable_ssh_key                   = false
  admin_password                   = var.vm_password
  nb_public_ip                     = 0
  nb_instances                     = 2
  diagnostic_sa                    = azurerm_storage_account.corpstorweupmgmtdiag10.name
  allocation_method                = "Static"
  boot_diagnostics                 = true
  data_disk_size_gb                = 128
  delete_data_disks_on_termination = true
  delete_os_disk_on_termination    = true
  nb_data_disk                     = 1
  data_sa_type                     = "Premium_LRS"
  tags                             = merge(local.prod-lmc-vm-tags, { "PatchGroup" = "4th Sat 10:00 AM IST", "Custom-AMI" = "False", "Role" = "Logic Monitor", "os-support" = "genpactcomputewindowsossupport@genpact.com", "OSType" = "Windows" })
  depends_on                       = [azurerm_resource_group.weu-lmc-rgs]

}



//weu Dev LMC not required for corp set up.

module "corp-rg-weu-dev-shared-management-logicmonitor-servers" {
  providers = {
    azurerm = azurerm.weu-management-sub
  }
  source                           = "../../Modules/Create-Vms"
  resource_group_name              = azurerm_resource_group.weu-lmc-rgs[1].name
  vm_hostname                      = "GCDWWEUAZLMC"
  vm_size                          = var.vm_dev_size
  vm_os_publisher                  = var.vm_os_windows_publisher
  vm_os_offer                      = var.vm_os_windows_offer
  vm_os_sku                        = var.vm_os_windows_sku
  vnet_subnet_id                   = azurerm_subnet.corp-weu-dev-management-subnet[0].id
  enable_ssh_key                   = false
  admin_password                   = var.vm_password
  nb_public_ip                     = 0
  nb_instances                     = 1
  diagnostic_sa                    = azurerm_storage_account.corpstorweudmgmtdiag10.name
  allocation_method                = "Static"
  boot_diagnostics                 = true
  data_disk_size_gb                = 128
  delete_data_disks_on_termination = true
  delete_os_disk_on_termination    = true
  nb_data_disk                     = 1
  data_sa_type                     = "StandardSSD_LRS"
  tags                             = merge(local.vm_tags, { "PatchGroup" = "3rd Sat 10:00 AM IST", "Custom-AMI" = "False", "Role" = "Logic Monitor", "os-support" = "genpactcomputewindowsossupport@genpact.com" })
  depends_on                       = [azurerm_resource_group.weu-lmc-rgs]
}
