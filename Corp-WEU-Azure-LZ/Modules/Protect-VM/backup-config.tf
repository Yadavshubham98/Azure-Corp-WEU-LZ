
data "azurerm_virtual_machine" "get-vm-name"{
  count =length(var.vm_list)
  name = element(var.vm_list,count.index)
  resource_group_name = var.vm_rg
}

resource "azurerm_backup_protected_vm" "vm" {
count =length(var.vm_list)
resource_group_name  =var.rsv_rg //resource group of the recovery services vault

source_vm_id        = data.azurerm_virtual_machine.get-vm-name[count.index].id
recovery_vault_name = var.rsv_name
backup_policy_id    = var.backup_policy_id
}

