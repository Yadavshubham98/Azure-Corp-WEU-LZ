# # //Prod and Dev Jump Servers

# # //IND
# # module "protect-ind-dev-servers-jmp" {
# #   providers = {
# #     azurerm = azurerm.ind-management-sub
# #   }

# #   source           = "../../Modules/Protect-VM"
# # #   vm_list          = ["GCDLCINAZJMP01", "GCDLCINAZJMP02", "GCDWCINAZJMP01", "GCDWCINAZJMP02"]
# #   vm_list          = ["GCDLCINAZJMP01","GCDWCINAZJMP01", "GCDWCINAZJMP02"]
# #   vm_rg            = "gch-rg-ind-dev-shared-management-core-jmp"
# #   rsv_rg           = azurerm_resource_group.ind-rsv-rgs[1].name
# #   rsv_name         = azurerm_recovery_services_vault.ind-dev-vault.name
# #   backup_policy_id = azurerm_backup_policy_vm.gch-ind-dev-daily-policy.id

# # }


# module "protect-eus-prod-servers-jmp" {
#   providers = {
#     azurerm = azurerm.eus-management-sub
#   }

#   source           = "../../Modules/Protect-VM"
#   vm_list          = ["GCHPLEUSAZJMP01", "GCHPLEUSAZJMP02", "GCHPWEUSAZJMP01", "GCHPWEUSAZJMP02"]
#   vm_rg            = "gch-rg-eus-prod-shared-management-core-jmp"
#   rsv_rg           = azurerm_resource_group.eus-rsv-rgs[0].name
#   rsv_name         = azurerm_recovery_services_vault.eus-vault.name
#   backup_policy_id = azurerm_backup_policy_vm.gch-eus-prod-daily-policy.id

# }

# module "protect-eus-prod-servers-jmp" {
#   providers = {
#     azurerm = azurerm.eus-management-sub
#   }

#   source           = "../../Modules/Protect-VM"
#   vm_list          = ["GCHPLEUSAZJMP01", "GCHPLEUSAZJMP02", "GCHPWEUSAZJMP01", "GCHPWEUSAZJMP02"]
#   vm_rg            = "gch-rg-eus-prod-shared-management-core-jmp"
#   rsv_rg           = azurerm_resource_group.eus-rsv-rgs[0].name
#   rsv_name         = azurerm_recovery_services_vault.eus-vault.name
#   backup_policy_id = azurerm_backup_policy_vm.gch-eus-prod-daily-policy.id

# }


# # # //NEU

# # # module "protect-neu-prod-servers-jmp" {
# # #   providers = {
# # #     azurerm = azurerm.neu-management-sub
# # #   }

# # #   source           = "../../Modules/Protect-VM"
# # #   vm_list          = ["GCPWNEUAZJMP01", "GCPLNEUAZJMP01"]
# # #   vm_rg            = "gch-rg-neu-prod-shared-management-core-jmp"
# # #   rsv_rg           = azurerm_resource_group.neu-rsv-rgs[0].name
# # #   rsv_name         = azurerm_recovery_services_vault.neu-vault.name
# # #   backup_policy_id = azurerm_backup_policy_vm.gch-neu-prod-daily-policy.id


# # # }

# # # module "protect-neu-dev-servers-jmp" {
# # #   providers = {
# # #     azurerm = azurerm.neu-management-sub
# # #   }

# # #   source           = "../../Modules/Protect-VM"
# # #   vm_list          = ["GCDLNEUAZJMP01", "GCDWNEUAZJMP01"]
# # #   vm_rg            = "gch-rg-neu-dev-shared-management-core-jmp"
# # #   rsv_rg           = azurerm_resource_group.neu-rsv-rgs[1].name
# # #   rsv_name         = azurerm_recovery_services_vault.neu-dev-vault.name
# # #   backup_policy_id = azurerm_backup_policy_vm.gch-neu-dev-daily-policy.id


# # # }

# # # //EUS

# # # module "protect-eus-dev-servers-jmp" {
# # #   providers = {
# # #     azurerm = azurerm.eus-management-sub
# # #   }

# # #   source           = "../../Modules/Protect-VM"
# # #   vm_list          = ["GCDLEUSAZJMP01", "GCDLEUSAZJMP02", "GCDWEUSAZJMP01", "GCDWEUSAZJMP02"]
# # #   vm_rg            = "gch-rg-eus-dev-shared-management-core-jmp"
# # #   rsv_rg           = azurerm_resource_group.eus-rsv-rgs[1].name
# # #   rsv_name         = azurerm_recovery_services_vault.eus-dev-vault.name
# # #   backup_policy_id = azurerm_backup_policy_vm.gch-eus-dev-daily-policy.id


# # # }


# # # module "protect-eus-prod-servers-jmp" {
# # #   providers = {
# # #     azurerm = azurerm.eus-management-sub
# # #   }

# # #   source           = "../../Modules/Protect-VM"
# # #   vm_list          = ["GCPLEUSAZJMP01", "GCPLEUSAZJMP02", "GCPWEUSAZJMP01", "GCPWEUSAZJMP02"]
# # #   vm_rg            = "gch-rg-eus-prod-shared-management-core-jmp"
# # #   rsv_rg           = azurerm_resource_group.eus-rsv-rgs[0].name
# # #   rsv_name         = azurerm_recovery_services_vault.eus-vault.name
# # #   backup_policy_id = azurerm_backup_policy_vm.gch-eus-prod-daily-policy.id


# # # }

# # # //WUS

# # # module "protect-wus-dev-servers-jmp" {
# # #   providers = {
# # #     azurerm = azurerm.wus-management-sub
# # #   }

# # #   source           = "../../Modules/Protect-VM"
# # #   vm_list          = ["GCDLWUSAZJMP01", "GCDLWUSAZJMP02", "GCDWWUSAZJMP01", "GCDWWUSAZJMP02"]
# # #   vm_rg            = "gch-rg-wus-dev-shared-management-core-jmp"
# # #   rsv_rg           = azurerm_resource_group.wus-rsv-rgs[1].name
# # #   rsv_name         = azurerm_recovery_services_vault.wus-dev-vault.name
# # #   backup_policy_id = azurerm_backup_policy_vm.gch-wus-dev-daily-policy.id


# # # }


# # # module "protect-wus-prod-servers-jmp" {
# # #   providers = {
# # #     azurerm = azurerm.wus-management-sub
# # #   }

# # #   source           = "../../Modules/Protect-VM"
# # #   vm_list          = ["GCPLWUSAZJMP01", "GCPLWUSAZJMP02", "GCPWWUSAZJMP01", "GCPWWUSAZJMP02"]
# # #   vm_rg            = "gch-rg-wus-prod-shared-management-core-jmp"
# # #   rsv_rg           = azurerm_resource_group.wus-rsv-rgs[0].name
# # #   rsv_name         = azurerm_recovery_services_vault.wus-vault.name
# # #   backup_policy_id = azurerm_backup_policy_vm.gch-wus-prod-daily-policy.id

# # # }


# # # //Identity Servers
# # # //IND DC
# # module "protect-ind-prod-servers-dc" {
# #   providers = {
# #     azurerm = azurerm.ind-identity-sub
# #   }

# #   source           = "../../Modules/Protect-VM"
# #   vm_list          = ["GCPWCINAZADC02", "GCPWCINAZADC01"]
# #   vm_rg            = "gch-rg-ind-prod-shared-identity-core-adc"
# #   rsv_rg           = azurerm_resource_group.ind-rsv-identity-rgs[0].name
# #   rsv_name         = azurerm_recovery_services_vault.ind-identity-vault.name
# #   backup_policy_id = azurerm_backup_policy_vm.gch-ind-prod-identity-daily-policy.id

# # }

# # module "protect-ind-dev-servers-dc" {
# #   providers = {
# #     azurerm = azurerm.ind-identity-sub
# #   }

# #   source           = "../../Modules/Protect-VM"
# #   vm_list          = ["GCDWCINAZADC01"]
# #   vm_rg            = "gch-rg-ind-dev-shared-identity-core-adc"
# #   rsv_rg           = azurerm_resource_group.ind-rsv-identity-rgs[1].name
# #   rsv_name         = azurerm_recovery_services_vault.ind-dev-identity-vault.name
# #   backup_policy_id = azurerm_backup_policy_vm.gch-ind-dev-identity-daily-policy.id

# # }

# # # //NEU DC

# # # module "protect-neu-prod-servers-dc" {
# # #   providers = {
# # #     azurerm = azurerm.neu-management-sub
# # #   }

# # #   source           = "../../Modules/Protect-VM"
# # #   vm_list          = ["GCPWCNEUAZADC02", "GCPWCNEUAZADC01"]
# # #   vm_rg            = "gch-rg-neu-prod-shared-identity-core-adc"
# # #   rsv_rg           = azurerm_resource_group.neu-rsv-rgs[0].name
# # #   rsv_name         = azurerm_recovery_services_vault.neu-vault.name
# # #   backup_policy_id = azurerm_backup_policy_vm.gch-neu-prod-daily-policy.id

# # # }

# # # module "protect-neu-dev-servers-dc" {
# # #   providers = {
# # #     azurerm = azurerm.neu-management-sub
# # #   }

# # #   source           = "../../Modules/Protect-VM"
# # #   vm_list          = ["GCDWNEUAZADC01"]
# # #   vm_rg            = "gch-rg-neu-dev-shared-identity-core-adc"
# # #   rsv_rg           = azurerm_resource_group.neu-rsv-rgs[1].name
# # #   rsv_name         = azurerm_recovery_services_vault.neu-dev-vault.name
# # #   backup_policy_id = azurerm_backup_policy_vm.gch-neu-dev-daily-policy.id


# # # }

# //EUS DC

# module "protect-eus-prod-servers-dc" {
#   providers = {
#     azurerm = azurerm.eus-identity-sub
#   }

#   source           = "../../Modules/Protect-VM"
#   vm_list          = ["GCHPWEUSAZADC01", "GCHPWEUSAZADC02"]
#   vm_rg            = "gch-rg-eus-prod-shared-identity-core-adc"
#   rsv_rg           = azurerm_resource_group.eus-rsv-identity-rgs[0].name
#   rsv_name         = azurerm_recovery_services_vault.eus-identity-vault.name
#   backup_policy_id = azurerm_backup_policy_vm.gch-eus-prod-identity-daily-policy.id

# }

# # # module "protect-eus-dev-servers-dc" {
# # #   providers = {
# # #     azurerm = azurerm.eus-management-sub
# # #   }

# # #   source           = "../../Modules/Protect-VM"
# # #   vm_list          = ["GCDWEUSAZADC01"]
# # #   vm_rg            = "gch-rg-eus-dev-shared-identity-core-adc"
# # #   rsv_rg           = azurerm_resource_group.eus-rsv-rgs[1].name
# # #   rsv_name         = azurerm_recovery_services_vault.eus-dev-vault.name
# # #   backup_policy_id = azurerm_backup_policy_vm.gch-eus-dev-daily-policy.id


# # # }


# # # //WUS DC


# # # module "protect-wus-prod-servers-dc" {
# # #   providers = {
# # #     azurerm = azurerm.wus-management-sub
# # #   }

# # #   source           = "../../Modules/Protect-VM"
# # #   vm_list          = ["GCPWWUSAZADC02", "GCPWWUSAZADC01"]
# # #   vm_rg            = "gch-rg-wus-prod-shared-identity-core-adc"
# # #   rsv_rg           = azurerm_resource_group.wus-rsv-rgs[0].name
# # #   rsv_name         = azurerm_recovery_services_vault.wus-vault.name
# # #   backup_policy_id = azurerm_backup_policy_vm.gch-wus-prod-daily-policy.id


# # # }

# # # module "protect-wus-dev-servers-dc" {
# # #   providers = {
# # #     azurerm = azurerm.wus-management-sub
# # #   }

# # #   source           = "../../Modules/Protect-VM"
# # #   vm_list          = ["GCDWWUSAZADC01"]
# # #   vm_rg            = "gch-rg-wus-dev-shared-identity-core-adc"
# # #   rsv_rg           = azurerm_resource_group.wus-rsv-rgs[1].name
# # #   rsv_name         = azurerm_recovery_services_vault.wus-dev-vault.name
# # #   backup_policy_id = azurerm_backup_policy_vm.gch-wus-dev-daily-policy.id


# # # }

# # # //IND Okta
# # module "protect-ind-prod-servers-okta" {
# #   providers = {
# #     azurerm = azurerm.ind-identity-sub
# #   }

# #   source           = "../../Modules/Protect-VM"
# #   vm_list          = ["GCPWCINAZOKT01", "GCPWCINAZOKT02"]
# #   vm_rg            = "gch-rg-ind-prod-shared-identity-core-okta"
# #   rsv_rg           = azurerm_resource_group.ind-rsv-identity-rgs[0].name
# #   rsv_name         = azurerm_recovery_services_vault.ind-identity-vault.name
# #   backup_policy_id = azurerm_backup_policy_vm.gch-ind-prod-identity-daily-policy.id


# # }

# # module "protect-ind-dev-servers-okta" {
# #   providers = {
# #     azurerm = azurerm.ind-identity-sub
# #   }

# #   source           = "../../Modules/Protect-VM"
# #   vm_list          = ["GCDWCINAZOKT01"]
# #   vm_rg            = "gch-rg-ind-dev-shared-identity-core-okta"
# #   rsv_rg           = azurerm_resource_group.ind-rsv-identity-rgs[1].name
# #   rsv_name         = azurerm_recovery_services_vault.ind-dev-identity-vault.name
# #   backup_policy_id = azurerm_backup_policy_vm.gch-ind-dev-identity-daily-policy.id


# # }

# # # //NEU OKTA

# # # module "protect-neu-prod-servers-okta" {
# # #   providers = {
# # #     azurerm = azurerm.neu-management-sub
# # #   }

# # #   source           = "../../Modules/Protect-VM"
# # #   vm_list          = ["GCPWNEUAZOKT01", "GCPWNEUAZOKT02"]
# # #   vm_rg            = "gch-rg-neu-prod-shared-identity-core-okta"
# # #   rsv_rg           = azurerm_resource_group.neu-rsv-rgs[0].name
# # #   rsv_name         = azurerm_recovery_services_vault.neu-vault.name
# # #   backup_policy_id = azurerm_backup_policy_vm.gch-neu-prod-daily-policy.id


# # # }

# # # module "protect-neu-dev-servers-okta" {
# # #   providers = {
# # #     azurerm = azurerm.neu-management-sub
# # #   }

# # #   source           = "../../Modules/Protect-VM"
# # #   vm_list          = ["GCDWNEUAZOKT01"]
# # #   vm_rg            = "gch-rg-neu-dev-shared-identity-core-okta"
# # #   rsv_rg           = azurerm_resource_group.neu-rsv-rgs[1].name
# # #   rsv_name         = azurerm_recovery_services_vault.neu-dev-vault.name
# # #   backup_policy_id = azurerm_backup_policy_vm.gch-neu-dev-daily-policy.id


# # # }

# //EUS Okta



# module "protect-eus-prod-servers-okta" {
#   providers = {
#     azurerm = azurerm.eus-identity-sub
#   }

#   source           = "../../Modules/Protect-VM"
#   vm_list          = ["GCHPWEUSAZOKT01", "GCHPWEUSAZOKT02"]
#   vm_rg            = "gch-rg-eus-prod-shared-identity-core-okta"
#   rsv_rg           = azurerm_resource_group.eus-rsv-identity-rgs[0].name
#   rsv_name         = azurerm_recovery_services_vault.eus-identity-vault.name
#   backup_policy_id = azurerm_backup_policy_vm.gch-eus-prod-identity-daily-policy.id
# }

# # # module "protect-eus-dev-servers-okta" {
# # #   providers = {
# # #     azurerm = azurerm.eus-management-sub
# # #   }

# # #   source           = "../../Modules/Protect-VM"
# # #   vm_list          = ["GCDWEUSAZOKT01"]
# # #   vm_rg            = "gch-rg-eus-dev-shared-identity-core-okta"
# # #   rsv_rg           = azurerm_resource_group.eus-rsv-rgs[1].name
# # #   rsv_name         = azurerm_recovery_services_vault.eus-dev-vault.name
# # #   backup_policy_id = azurerm_backup_policy_vm.gch-eus-dev-daily-policy.id


# # # }


# # # //WUS Okta



# # # module "protect-wus-prod-servers-okta" {
# # #   providers = {
# # #     azurerm = azurerm.wus-management-sub
# # #   }

# # #   source           = "../../Modules/Protect-VM"
# # #   vm_list          = ["GCPWWUSAZOKT01", "GCPWWUSAZOKT02"]
# # #   vm_rg            = "gch-rg-wus-prod-shared-identity-core-okta"
# # #   rsv_rg           = azurerm_resource_group.wus-rsv-rgs[0].name
# # #   rsv_name         = azurerm_recovery_services_vault.wus-vault.name
# # #   backup_policy_id = azurerm_backup_policy_vm.gch-wus-prod-daily-policy.id


# # # }

# # # module "protect-wus-dev-servers-okta" {
# # #   providers = {
# # #     azurerm = azurerm.wus-management-sub
# # #   }

# # #   source           = "../../Modules/Protect-VM"
# # #   vm_list          = ["GCDWWUSAZOKT01"]
# # #   vm_rg            = "gch-rg-wus-dev-shared-identity-core-okta"
# # #   rsv_rg           = azurerm_resource_group.wus-rsv-rgs[1].name
# # #   rsv_name         = azurerm_recovery_services_vault.wus-dev-vault.name
# # #   backup_policy_id = azurerm_backup_policy_vm.gch-wus-dev-daily-policy.id


# # # }

# # # //LMC servers

# # //IND LMC
# # module "protect-ind-prod-servers-lmc" {
# #   providers = {
# #     azurerm = azurerm.ind-management-sub
# #   }

# #   source           = "../../Modules/Protect-VM"
# #   vm_list          = ["GCPWCINAZLMC01", "GCPWCINAZLMC02"]
# #   vm_rg            = "gch-rg-ind-prod-shared-management-core-lmc"
# #   rsv_rg           = azurerm_resource_group.ind-rsv-rgs[0].name
# #   rsv_name         = azurerm_recovery_services_vault.ind-vault.name
# #   backup_policy_id = azurerm_backup_policy_vm.gch-ind-prod-daily-policy.id


# # }

# # module "protect-ind-dev-servers-lmc" {
# #   providers = {
# #     azurerm = azurerm.ind-management-sub
# #   }

# #   source           = "../../Modules/Protect-VM"
# #   vm_list          = ["GCDWCINAZLMC01"]
# #   vm_rg            = "gch-rg-ind-dev-shared-management-core-lmc"
# #   rsv_rg           = azurerm_resource_group.ind-rsv-rgs[1].name
# #   rsv_name         = azurerm_recovery_services_vault.ind-dev-vault.name
# #   backup_policy_id = azurerm_backup_policy_vm.gch-ind-dev-daily-policy.id


# # }


# # # //NEU LMC


# # # module "protect-neu-prod-servers-lmc" {
# # #   providers = {
# # #     azurerm = azurerm.neu-management-sub
# # #   }

# # #   source           = "../../Modules/Protect-VM"
# # #   vm_list          = ["GCPWNEUAZLMC01"]
# # #   vm_rg            = "gch-rg-neu-prod-shared-management-core-lmc"
# # #   rsv_rg           = azurerm_resource_group.neu-rsv-rgs[0].name
# # #   rsv_name         = azurerm_recovery_services_vault.neu-vault.name
# # #   backup_policy_id = azurerm_backup_policy_vm.gch-neu-prod-daily-policy.id


# # # }

# # # module "protect-neu-dev-servers-lmc" {
# # #   providers = {
# # #     azurerm = azurerm.neu-management-sub
# # #   }a

# # #   source           = "../../Modules/Protect-VM"
# # #   vm_list          = ["GCDWNEUAZLMC01"]
# # #   vm_rg            = "gch-rg-neu-dev-shared-management-core-lmc"
# # #   rsv_rg           = azurerm_resource_group.neu-rsv-rgs[1].name
# # #   rsv_name         = azurerm_recovery_services_vault.neu-dev-vault.name
# # #   backup_policy_id = azurerm_backup_policy_vm.gch-neu-dev-daily-policy.id


# # # }



# //EUS LMC


# module "protect-eus-prod-servers-lmc" {
#   providers = {
#     azurerm = azurerm.eus-management-sub
#   }

#   source           = "../../Modules/Protect-VM"
#   vm_list          = ["GCHPWEUSAZLMC01"]
#   vm_rg            = "gch-rg-eus-prod-shared-management-core-lmc"
#   rsv_rg           = azurerm_resource_group.eus-rsv-rgs[0].name
#   rsv_name         = azurerm_recovery_services_vault.eus-vault.name
#   backup_policy_id = azurerm_backup_policy_vm.gch-eus-prod-daily-policy.id


# }

# # # module "protect-eus-dev-servers-lmc" {
# # #   providers = {
# # #     azurerm = azurerm.eus-management-sub
# # #   }

# # #   source           = "../../Modules/Protect-VM"
# # #   vm_list          = ["GCDWEUSAZLMC01"]
# # #   vm_rg            = "gch-rg-eus-dev-shared-management-core-lmc"
# # #   rsv_rg           = azurerm_resource_group.eus-rsv-rgs[1].name
# # #   rsv_name         = azurerm_recovery_services_vault.eus-dev-vault.name
# # #   backup_policy_id = azurerm_backup_policy_vm.gch-eus-dev-daily-policy.id


# # # }


# # # //WUS LMC


# # # module "protect-wus-prod-servers-lmc" {
# # #   providers = {
# # #     azurerm = azurerm.wus-management-sub
# # #   }

# # #   source           = "../../Modules/Protect-VM"
# # #   vm_list          = ["GCPWWUSAZLMC01"]
# # #   vm_rg            = "gch-rg-wus-prod-shared-management-core-lmc"
# # #   rsv_rg           = azurerm_resource_group.wus-rsv-rgs[0].name
# # #   rsv_name         = azurerm_recovery_services_vault.wus-vault.name
# # #   backup_policy_id = azurerm_backup_policy_vm.gch-wus-prod-daily-policy.id


# # # }

# # # module "protect-wus-dev-servers-lmc" {
# # #   providers = {
# # #     azurerm = azurerm.wus-management-sub
# # #   }

# # #   source           = "../../Modules/Protect-VM"
# # #   vm_list          = ["GCDWWUSAZLMC01"]
# # #   vm_rg            = "gch-rg-wus-dev-shared-management-core-lmc"
# # #   rsv_rg           = azurerm_resource_group.wus-rsv-rgs[1].name
# # #   rsv_name         = azurerm_recovery_services_vault.wus-dev-vault.name
# # #   backup_policy_id = azurerm_backup_policy_vm.gch-wus-dev-daily-policy.id


# # # }


# # # //ZPA Servers


# # # //IND ZPA


# # module "protect-ind-prod-servers-zpa" {
# #   providers = {
# #     azurerm = azurerm.ind-management-sub
# #   }

# #   source           = "../../Modules/Protect-VM"
# #   vm_list          = ["GCPLCINAZZPA01", "GCPLCINAZZPA02"]
# #   vm_rg            = "gch-rg-ind-prod-shared-management-core-zpa"
# #   rsv_rg           = azurerm_resource_group.ind-rsv-rgs[0].name
# #   rsv_name         = azurerm_recovery_services_vault.ind-vault.name
# #   backup_policy_id = azurerm_backup_policy_vm.gch-ind-prod-daily-policy.id


# # }

# # module "protect-ind-dev-servers-zpa" {
# #   providers = {
# #     azurerm = azurerm.ind-management-sub
# #   }

# #   source           = "../../Modules/Protect-VM"
# #   vm_list          = ["GCDLCINAZZPA01"]
# #   vm_rg            = "gch-rg-ind-dev-shared-management-core-zpa"
# #   rsv_rg           = azurerm_resource_group.ind-rsv-rgs[1].name
# #   rsv_name         = azurerm_recovery_services_vault.ind-dev-vault.name
# #   backup_policy_id = azurerm_backup_policy_vm.gch-ind-dev-daily-policy.id


# # }

# # # //NEU ZPA



# # # module "protect-neu-prod-servers-zpa" {
# # #   providers = {
# # #     azurerm = azurerm.neu-management-sub
# # #   }

# # #   source           = "../../Modules/Protect-VM"
# # #   vm_list          = ["GCPLNEUAZZPA01", "GCPLNEUAZZPA02"]
# # #   vm_rg            = "gch-rg-neu-prod-shared-management-core-zpa"
# # #   rsv_rg           = azurerm_resource_group.neu-rsv-rgs[0].name
# # #   rsv_name         = azurerm_recovery_services_vault.neu-vault.name
# # #   backup_policy_id = azurerm_backup_policy_vm.gch-neu-prod-daily-policy.id


# # # }

# # # module "protect-neu-dev-servers-zpa" {
# # #   providers = {
# # #     azurerm = azurerm.neu-management-sub
# # #   }

# # #   source           = "../../Modules/Protect-VM"
# # #   vm_list          = ["GCDLNEUAZZPA01"]
# # #   vm_rg            = "gch-rg-neu-dev-shared-management-core-zpa"
# # #   rsv_rg           = azurerm_resource_group.neu-rsv-rgs[1].name
# # #   rsv_name         = azurerm_recovery_services_vault.neu-dev-vault.name
# # #   backup_policy_id = azurerm_backup_policy_vm.gch-neu-dev-daily-policy.id


# # # }

# # # //EUS ZPA


# module "protect-eus-prod-servers-zpa" {
#   providers = {
#     azurerm = azurerm.eus-management-sub
#   }

#   source           = "../../Modules/Protect-VM"
#   vm_list          = ["GCHPLEUSAZZPA01", "GCHPLEUSAZZPA02"]
#   vm_rg            = "gch-rg-eus-prod-shared-management-core-zpa"
#   rsv_rg           = azurerm_resource_group.eus-rsv-rgs[0].name
#   rsv_name         = azurerm_recovery_services_vault.eus-vault.name
#   backup_policy_id = azurerm_backup_policy_vm.gch-eus-prod-daily-policy.id
# }

# # # module "protect-eus-dev-servers-zpa" {
# # #   providers = {
# # #     azurerm = azurerm.eus-management-sub
# # #   }

# # #   source           = "../../Modules/Protect-VM"
# # #   vm_list          = ["GCDLEUSAZZPA01"]
# # #   vm_rg            = "gch-rg-eus-dev-shared-management-core-zpa"
# # #   rsv_rg           = azurerm_resource_group.eus-rsv-rgs[1].name
# # #   rsv_name         = azurerm_recovery_services_vault.eus-dev-vault.name
# # #   backup_policy_id = azurerm_backup_policy_vm.gch-eus-dev-daily-policy.id


# # # }


# # # //WUS ZPA


# # # module "protect-wus-prod-servers-zpa" {
# # #   providers = {
# # #     azurerm = azurerm.wus-management-sub
# # #   }

# # #   source           = "../../Modules/Protect-VM"
# # #   vm_list          = ["GCPLWUSAZZPA01", "GCPLWUSAZZPA02"]
# # #   vm_rg            = "gch-rg-wus-prod-shared-management-core-zpa"
# # #   rsv_rg           = azurerm_resource_group.wus-rsv-rgs[0].name
# # #   rsv_name         = azurerm_recovery_services_vault.wus-vault.name
# # #   backup_policy_id = azurerm_backup_policy_vm.gch-wus-prod-daily-policy.id


# # # }

# # # module "protect-wus-dev-servers-zpa" {
# # #   providers = {
# # #     azurerm = azurerm.wus-management-sub
# # #   }

# # #   source           = "../../Modules/Protect-VM"
# # #   vm_list          = ["GCDLWUSAZZPA01"]
# # #   vm_rg            = "gch-rg-wus-dev-shared-management-core-zpa"
# # #   rsv_rg           = azurerm_resource_group.wus-rsv-rgs[1].name
# # #   rsv_name         = azurerm_recovery_services_vault.wus-dev-vault.name
# # #   backup_policy_id = azurerm_backup_policy_vm.gch-wus-dev-daily-policy.id


# # # }