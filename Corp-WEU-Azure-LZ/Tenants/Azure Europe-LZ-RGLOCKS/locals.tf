//REQUIRED - Set individual subscription_ids for each platform/landing zone

locals {
  //Local variables for Subscription IDs

  platform-weu-connectivity-sub = "cd3e41b0-e36e-4e0c-b312-dc2652a58937"
  platform-weu-identity-sub     = "fff4616a-15b4-4270-ac68-ff46328705c3"
  platform-weu-management-sub   = "ea239165-5171-4a00-bbca-85b0a1a78867"
  platform-weu-security-sub     = "d0a5620a-4b58-415a-8184-bc2b953608d8"


  weu-prod-tas-sub = "39944571-c9b5-4798-9c74-bde2cd84c725"
  weu-prod-tis-sub = "39944571-c9b5-4798-9c74-bde2cd84c725"
  weu-dev-tas-sub  = "c4375144-49f5-488d-802e-ab6d90a9af62"
  weu-dev-tis-sub  = "c4375144-49f5-488d-802e-ab6d90a9af62"
  weu-uat-tas-sub  = "4fd81746-d856-4c42-b0fc-a0834c28f506"
  weu-uat-tis-sub  = "4fd81746-d856-4c42-b0fc-a0834c28f506"
  # genpact-cloud-hosting-sub = "de52f15e-9c68-4673-b173-9de91aa89657"
  genpact-corporate-sub = "2e636dce-89ae-453f-91fa-beadd0116b65"

}

locals {
  backup-service-object-id = "0725efb5-82a7-4568-89e9-fce6cf0572a6"
}



################################## Start of Local variables for all resources



locals {

  //Resource Groups for Identity environments
  ind-identity-rgs = ["corp-rg-ind-prod-shared-identity-core-adc", "corp-rg-ind-prod-shared-identity-core-okta", "corp-rg-ind-dev-shared-identity-core-adc", "corp-rg-ind-dev-shared-identity-core-okta"]
  neu-identity-rgs = ["corp-rg-neu-prod-shared-identity-core-adc", "corp-rg-neu-prod-shared-identity-core-okta", "corp-rg-neu-dev-shared-identity-core-adc", "corp-rg-neu-dev-shared-identity-core-okta"]
  wus-identity-rgs = ["corp-rg-wus-prod-shared-identity-core-adc", "corp-rg-wus-prod-shared-identity-core-okta", "corp-rg-wus-dev-shared-identity-core-adc", "corp-rg-wus-dev-shared-identity-core-okta"]
  weu-identity-rgs = ["corp-rg-weu-prod-shared-identity-core-adc", "corp-rg-weu-prod-shared-identity-core-okta", "corp-rg-weu-dev-shared-identity-core-adc", "corp-rg-weu-dev-shared-identity-core-okta"]

  //Resource Groups for ZScalers Management environments
  ind-zpa-rgs = ["corp-rg-ind-prod-shared-management-core-zpa", "corp-rg-ind-dev-shared-management-core-zpa"]
  neu-zpa-rgs = ["corp-rg-neu-prod-shared-management-core-zpa", "corp-rg-neu-dev-shared-management-core-zpa"]
  wus-zpa-rgs = ["corp-rg-wus-prod-shared-management-core-zpa", "corp-rg-wus-dev-shared-management-core-zpa"]
  weu-zpa-rgs = ["corp-rg-weu-prod-shared-management-core-zpa", "corp-rg-weu-dev-shared-management-core-zpa"]

  //Resource Groups for Mgmt
  ind-mgmt-rgs = ["corp-rg-ind-dev-shared-management-core-network", "corp-rg-ind-prod-shared-management-core-network"]
  weu-mgmt-rgs = ["corp-rg-weu-dev-shared-management-core-network", "corp-rg-weu-prod-shared-management-core-network"]
  wus-mgmt-rgs = ["corp-rg-wus-dev-shared-management-core-network", "corp-rg-wus-prod-shared-management-core-network"]
  neu-mgmt-rgs = ["corp-rg-neu-dev-shared-management-core-network", "corp-rg-neu-prod-shared-management-core-network"]

  //Resource Groups for Logic Monitor
  ind-lmc-rgs = ["corp-rg-ind-prod-shared-management-core-lmc", "corp-rg-ind-dev-shared-management-core-lmc"]
  neu-lmc-rgs = ["corp-rg-neu-prod-shared-management-core-lmc", "corp-rg-neu-dev-shared-management-core-lmc"]
  wus-lmc-rgs = ["corp-rg-wus-prod-shared-management-core-lmc", "corp-rg-wus-dev-shared-management-core-lmc"]
  weu-lmc-rgs = ["corp-rg-weu-prod-shared-management-core-lmc", "corp-rg-weu-dev-shared-management-core-lmc"]

  //Resource Groups for Jump Servers
  ind-jmp-rgs = ["corp-rg-ind-prod-shared-management-core-jmp", "corp-rg-ind-dev-shared-management-core-jmp"]
  weu-jmp-rgs = ["corp-rg-weu-prod-shared-management-core-jmp", "corp-rg-weu-dev-shared-management-core-jmp"]
  wus-jmp-rgs = ["corp-rg-wus-prod-shared-management-core-jmp", "corp-rg-wus-dev-shared-management-core-jmp"]
  neu-jmp-rgs = ["corp-rg-neu-prod-shared-management-core-jmp", "corp-rg-neu-dev-shared-management-core-jmp"]

  //Resource Groups for Keyvault Services

  # ind-akv-rgs = ["corp-rg-ind-prod-shared-management-core-akv", "corp-rg-ind-dev-shared-management-core-akv"]
  weu-akv-rgs = ["corp-rg-weu-uat-tis-akv", "corp-rg-weu-uat-tas-akv", "corp-rg-weu-prod-tis-akv", "corp-rg-weu-prod-tas-akv", "corp-rg-weu-prod-shared-security-akv", "corp-rg-weu-prod-shared-management-akv", "corp-rg-weu-dev-shared-management-akv", "corp-rg-weu-dev-tis-akv", "corp-rg-weu-dev-tas-akv", "corp-rg-weu-prod-shared-identity-akv", "corp-rg-weu-dev-shared-identity-akv"]
  ind-akv-rgs = ["corp-rg-ind-prod-shared-management-core-akv", "corp-rg-ind-dev-shared-management-core-akv"]
  wus-akv-rgs = ["corp-rg-wus-prod-shared-management-core-akv", "corp-rg-wus-dev-shared-management-core-akv"]
  neu-akv-rgs = ["corp-rg-neu-prod-shared-management-core-akv", "corp-rg-neu-dev-shared-management-core-akv"]

  //Resource Groups for Recovey Services Vault

  weu-rsv-rgs          = ["corp-rg-weu-prod-shared-management-core-rsv", "corp-rg-weu-dev-shared-management-core-rsv"]
  weu-rsv-identity-rgs = ["corp-rg-weu-prod-shared-identity-core-rsv", "corp-rg-weu-dev-shared-identity-core-rsv"]

  weu-rsv-prod-rgs = ["corp-rg-weu-prod-tis-core-rsv", "corp-rg-weu-prod-tas-core-rsv"]
  weu-rsv-dev-rgs  = ["corp-rg-weu-dev-tis-core-rsv", "corp-rg-weu-dev-tas-core-rsv"]
  weu-rsv-uat-rgs  = ["corp-rg-weu-uat-tis-core-rsv", "corp-rg-weu-uat-tas-core-rsv"]
  #weu-rsv-security= ["corp-rg-weu-shared-security-core-rsv"]

  neu-rsv-rgs = ["corp-rg-neu-prod-shared-management-core-rsv", "corp-rg-neu-dev-shared-management-core-rsv"]
  ind-rsv-rgs = ["corp-rg-ind-prod-shared-management-core-rsv", "corp-rg-ind-dev-shared-management-core-rsv"]
  wus-rsv-rgs = ["corp-rg-wus-prod-shared-management-core-rsv", "corp-rg-wus-dev-shared-management-core-rsv"]

  //Resource Groups for Boot Diagnostics

  # weu-bootdiag-rgs = ["corp-rg-weu-prod-shared-boot-diag", "corp-rg-weu-dev-shared-boot-diag", "corp-rg-weu-prod-tas-boot-diag", "corp-rg-weu-prod-tis-boot-diag", "corp-rg-weu-dev-tas-boot-diag", "corp-rg-weu-dev-tis-boot-diag"]
  weu-bootdiag-rgs = ["corp-rg-weu-uat-tis-bootdiag", "corp-rg-weu-uat-tas-bootdiag", "corp-rg-weu-prod-tis-bootdiag", "corp-rg-weu-prod-tas-bootdiag", "corp-rg-weu-prod-shared-security-bootdiag", "corp-rg-weu-prod-shared-management-bootdiag", "corp-rg-weu-dev-shared-management-bootdiag", "corp-rg-weu-dev-tis-bootdiag", "corp-rg-weu-dev-tas-bootdiag", "corp-rg-weu-prod-shared-identity-bootdiag", "corp-rg-weu-dev-shared-identity-bootdiag"]
  neu-bootdiag-rgs = ["corp-rg-neu-prod-shared-boot-diag", "corp-rg-neu-dev-shared-boot-diag", "corp-rg-neu-prod-tas-boot-diag", "corp-rg-neu-prod-tis-boot-diag", "corp-rg-neu-dev-tas-boot-diag", "corp-rg-neu-dev-tis-boot-diag"]
  wus-bootdiag-rgs = ["corp-rg-wus-prod-shared-boot-diag", "corp-rg-wus-dev-shared-boot-diag", "corp-rg-wus-prod-tas-boot-diag", "corp-rg-wus-prod-tis-boot-diag", "corp-rg-wus-dev-tas-boot-diag", "corp-rg-wus-dev-tis-boot-diag"]
  ind-bootdiag-rgs = ["corp-rg-ind-prod-shared-boot-diag", "corp-rg-ind-dev-shared-boot-diag", "corp-rg-ind-prod-tas-boot-diag", "corp-rg-ind-prod-tis-boot-diag", "corp-rg-ind-dev-tas-boot-diag", "corp-rg-ind-dev-tis-boot-diag"]

  //Resource Groups for Prod Regional Log Analytics
  security-subscription-rg = ["corp-rg-weu-prod-shared-security-analytics-log", "corp-rg-weu-prod-shared-flowlog-storage", "corp-rg-weu-dev-shared-flowlog-storage"]
  private-dns-zone-rg      = ["corp-rg-weu-prod-shared-private-dns-zone", "corp-rg-weu-dev-shared-private-dns-zone"]

  # all-regions-laworkspace-rg = ["corp-rg-ind-prod-shared-manssagement-core-log", "corp-rg-neu-prod-shared-management-core-log", "corp-rg-weu-prod-shared-management-core-log", "corp-rg-wus-prod-shared-management-core-log"]

}
locals {

  //Local variables for Azure subnets and subnet names

  weu-prod-management-subnet_name             = ["corp-snet-weu-prod-shared-mgmt-private-01", "corp-snet-weu-prod-shared-mgmt-public-01", "corp-snet-weu-prod-shared-mgmt-db-01"]
  weu-prod-management-subnet_address_prefixes = ["10.251.0.0/26", "10.251.0.64/26", "10.251.0.128/26"]

  weu-dev-management-subnet_name             = ["corp-snet-weu-dev-shared-mgmt-private-01", "corp-snet-weu-dev-shared-mgmt-public-01", "corp-snet-weu-dev-shared-mgmt-db-01"]
  weu-dev-management-subnet_address_prefixes = ["10.251.2.0/26", "10.251.2.64/26", "10.251.2.128/26"]

  weu-prod-identity-subnet_name             = ["corp-snet-weu-prod-shared-identity-private-01", "corp-snet-weu-prod-shared-identity-public-01", "corp-snet-weu-prod-shared-identity-db-01"]
  weu-prod-identity-subnet_address_prefixes = ["10.251.4.0/26", "10.251.4.64/26", "10.251.4.128/26"]

  weu-dev-identity-subnet_name             = ["corp-snet-weu-dev-shared-identity-private-01", "corp-snet-weu-dev-shared-identity-public-01", "corp-snet-weu-dev-shared-identity-db-01"]
  weu-dev-identity-subnet_address_prefixes = ["10.251.6.0/26", "10.251.6.64/26", "10.251.6.128/26"]


  //weu

  weu-prod-tis-subnet-name = ["corp-snet-weu-prod-tis-private-01", "corp-snet-weu-prod-tis-public-01", "corp-snet-weu-prod-tis-db-01"]
  weu-prod-tis-subnet      = ["10.251.8.0/26", "10.251.8.64/26", "10.251.8.128/26"]


  weu-prod-tas-subnet-name = ["corp-snet-weu-prod-tas-private-01", "corp-snet-weu-prod-tas-public-01", "corp-snet-weu-prod-tas-db-01"]
  weu-prod-tas-subnet      = ["10.251.16.0/26", "10.251.16.64/26", "10.251.16.128/26"]

  weu-dev-tis-subnet-name = ["corp-snet-weu-dev-tis-private-01", "corp-snet-weu-dev-tis-public-01", "corp-snet-weu-dev-tis-db-01"]
  weu-dev-tis-subnet      = ["10.251.14.0/26", "10.251.14.64/26", "10.251.14.128/26"]

  weu-dev-tas-subnet-name = ["corp-snet-weu-dev-tas-private-01", "corp-snet-weu-dev-tas-public-01", "corp-snet-weu-dev-tas-db-01"]
  weu-dev-tas-subnet      = ["10.251.22.0/26", "10.251.22.64/26", "10.251.22.128/26"]

  weu-uat-tis-subnet-name = ["corp-snet-weu-uat-tis-private-01", "corp-snet-weu-uat-tis-public-01", "corp-snet-weu-uat-tis-db-01"]
  weu-uat-tis-subnet      = ["10.251.12.0/26", "10.251.12.64/26", "10.251.12.128/26"]

  weu-uat-tas-subnet-name = ["corp-snet-weu-uat-tas-private-01", "corp-snet-weu-uat-tas-public-01", "corp-snet-weu-uat-tas-db-01"]
  weu-uat-tas-subnet      = ["10.251.20.0/26", "10.251.20.64/26", "10.251.20.128/26"]

}

locals {
  dns_zones = ["privatelink.blob.core.windows.net", "privatelink.database.windows.net", "privatelink.file.core.windows.net", "privatelink.vaultcore.azure.net", "privatelink.adf.azure.com", "privatelink.api.azureml.ms", "privatelink.azure-automation.net", "privatelink.azurewebsites.net", "privatelink.datafactory.azure.net", "privatelink.openai.azure.com", "privatelink.queue.core.windows.net", "privatelink.search.windows.net", "privatelink.web.core.windows.net"]
}




locals {
  vm-keys-weu = ["vm-key-weu-uat-tis-01", "vm-key-weu-uat-tas-01", "vm-key-weu-prod-tis-01", "vm-key-weu-prod-tas-01", "vm-key-weu-prod-sec-01", "vm-key-weu-prod-mgmt-01", "vm-key-weu-dev-mgmt-01", "vm-key-weu-dev-tis-01", "vm-key-weu-dev-tas-01", "vm-key-weu-prod-identity-01", "vm-key-weu-dev-identity-01"]
  vm-keys-neu = ["vm-key-neu-prod-01", "vm-key-neu-dev-01"]
  vm-keys-ind = ["vm-key-ind-prod-01", "vm-key-ind-dev-01"]
  vm-keys-wus = ["vm-key-wus-prod-01", "vm-key-wus-dev-01"]
}

locals {
  //Regional Network and Landing Zones (tis/tas) tags

  prod_shared_network_tags = {
    "ApplicationSupport" = "genpactcloudsupport@genpact.com"
    "OwnerSupervisor"    = "rajesh.barhia@genpact.com"
    "Owner"              = "ravinder.bhati@genpact.com"
    "ProjectName"        = "CORP Europe Azure Landing Zone"
    "BusinessVertical"   = "CorpIT"
    "SDOCode"            = "8561"
    "CCCode"             = "180"
    "ProvisioningSR"     = "CHG0082390"
    "PID"                = "shared"
    "Department"         = "shared"
    "Stack"              = "Prod"
    "ProvisionedBy"      = "Terraform"
    "supportcost"        = "$"
  }

  prod_tis_network_tags = {
    "ApplicationSupport" = "genpactcloudsupport@genpact.com"
    "OwnerSupervisor"    = "rajesh.barhia@genpact.com"
    "Owner"              = "ravinder.bhati@genpact.com"
    "ProjectName"        = "CORP Europe Azure Landing Zone"
    "BusinessVertical"   = "CorpIT"
    "SDOCode"            = "8561"
    "CCCode"             = "180"
    "ProvisioningSR"     = "CHG0082390"
    "PID"                = "tis-shared"
    "Department"         = "tis"
    "Stack"              = "Prod"
    "ProvisionedBy"      = "Terraform"
    "supportcost"        = "$"
  }


  prod_tas_network_tags = {
    "ApplicationSupport" = "genpactcloudsupport@genpact.com"
    "OwnerSupervisor"    = "rajesh.barhia@genpact.com"
    "Owner"              = "ravinder.bhati@genpact.com"
    "ProjectName"        = "CORP Europe Azure Landing Zone"
    "BusinessVertical"   = "CorpIT"
    "SDOCode"            = "8561"
    "CCCode"             = "180"
    "ProvisioningSR"     = "CHG0082390"
    "PID"                = "tas-shared"
    "Department"         = "tas"
    "Stack"              = "Prod"
    "ProvisionedBy"      = "Terraform"
    "supportcost"        = "$"

  }
  dev_shared_network_tags = {
    "ApplicationSupport" = "genpactcloudsupport@genpact.com"
    "OwnerSupervisor"    = "rajesh.barhia@genpact.com"
    "Owner"              = "ravinder.bhati@genpact.com"
    "ProjectName"        = "CORP Europe Azure Landing Zone"
    "BusinessVertical"   = "CorpIT"
    "SDOCode"            = "8561"
    "CCCode"             = "180"
    "ProvisioningSR"     = "CHG0082390"
    "PID"                = "shared"
    "Department"         = "shared"
    "Stack"              = "Dev"
    "ProvisionedBy"      = "Terraform"
    "supportcost"        = "$"
  }

  dev_tis_network_tags = {
    "ApplicationSupport" = "genpactcloudsupport@genpact.com"
    "OwnerSupervisor"    = "rajesh.barhia@genpact.com"
    "Owner"              = "ravinder.bhati@genpact.com"
    "ProjectName"        = "CORP Europe Azure Landing Zone"
    "BusinessVertical"   = "CorpIT"
    "SDOCode"            = "8561"
    "CCCode"             = "180"
    "ProvisioningSR"     = "CHG0082390"
    "PID"                = "tis-shared"
    "Department"         = "tis"
    "Stack"              = "Dev"
    "ProvisionedBy"      = "Terraform"
    "supportcost"        = "$"
  }
  dev_tas_network_tags = {
    "ApplicationSupport" = "genpactcloudsupport@genpact.com"
    "OwnerSupervisor"    = "rajesh.barhia@genpact.com"
    "Owner"              = "ravinder.bhati@genpact.com"
    "ProjectName"        = "CORP Europe Azure Landing Zone"
    "BusinessVertical"   = "CorpIT"
    "SDOCode"            = "8561"
    "CCCode"             = "180"
    "ProvisioningSR"     = "CHG0082390"
    "PID"                = "tas-shared"
    "Department"         = "tas"
    "Stack"              = "Dev"
    "ProvisionedBy"      = "Terraform"
    "supportcost"        = "$"
  }
  uat_tis_network_tags = {
    "ApplicationSupport" = "genpactcloudsupport@genpact.com"
    "OwnerSupervisor"    = "rajesh.barhia@genpact.com"
    "Owner"              = "ravinder.bhati@genpact.com"
    "ProjectName"        = "CORP Europe Azure Landing Zone"
    "BusinessVertical"   = "CorpIT"
    "SDOCode"            = "8561"
    "CCCode"             = "180"
    "ProvisioningSR"     = "CHG0082390"
    "PID"                = "tis-shared"
    "Department"         = "tis"
    "Stack"              = "UAT"
    "ProvisionedBy"      = "Terraform"
    "supportcost"        = "$"
  }
  uat_tas_network_tags = {
    "ApplicationSupport" = "genpactcloudsupport@genpact.com"
    "OwnerSupervisor"    = "rajesh.barhia@genpact.com"
    "Owner"              = "ravinder.bhati@genpact.com"
    "ProjectName"        = "CORP Europe Azure Landing Zone"
    "BusinessVertical"   = "CorpIT"
    "SDOCode"            = "8561"
    "CCCode"             = "180"
    "ProvisioningSR"     = "CHG0082390"
    "PID"                = "tas-shared"
    "Department"         = "tas"
    "Stack"              = "UAT"
    "ProvisionedBy"      = "Terraform"
    "supportcost"        = "$"
  }

  prod_shared_zcc_tags = {
    ApplicationSupport = "GenpactProxySupport@genpact.com"
    supportcost        = "$"
    BusinessVertical   = "CorpIT"
    ProvisionedBy      = "Terraform"
    ProjectName        = "corporate"
    PID                = "shared"
    SDOCode            = "8561"
    OwnerSupervisor    = "gaurav.demiwal@genpact.com"
    Stack              = "Prod"
    ProvisioningSR     = "CHG0082390"
    CCCode             = "180"
    Owner              = "keshav.rajput@genpact.com"
    Department         = "shared"
  }

  vm_tags = {

    "Backup"              = "Daily"
    "DeploymentType"      = "NN"
    "Exception"           = "No"
    "InstanceSchedule"    = "24*7"
    "RI"                  = "TBD"
    "ScheduleforDeletion" = "No"
    "ServiceType"         = "IAAS"
    "ProvisionedBy"       = "Terraform"
    "supportcost"         = "$"

  }
  prod-lmc-vm-tags = {
    "ApplicationSupport"  = "genpactnmgtoolsteam@genpact.com"
    "OwnerSupervisor"     = "Steven.Zhang@genpact.com"
    "Owner"               = "venkataganeshbabu.k@genpact.com"
    "ProjectName"         = "CORP Europe Azure Landing Zone"
    "BusinessVertical"    = "CorpIT"
    "SDOCode"             = "8561"
    "CCCode"              = "180"
    "ProvisioningSR"      = "CHG0082390"
    "PID"                 = "shared"
    "Department"          = "shared"
    "Stack"               = "Prod"
    "ProvisionedBy"       = "Terraform"
    "supportcost"         = "$"
    "ServiceType"         = "IAAS"
    "Backup"              = "Daily"
    "DeploymentType"      = "NN"
    "Exception"           = "No"
    "InstanceSchedule"    = "24*7"
    "RI"                  = "TBD"
    "ScheduleforDeletion" = "No"
  }

  prod-jump-vm-tags = {
    "ApplicationSupport"  = "genpactcloudsupport@genpact.com"
    "OwnerSupervisor"     = "santhosh.srihari@genpact.com"
    "Owner"               = "Ankur.Singhal@genpact.com"
    "ProjectName"         = "CORP Europe Azure Landing Zone"
    "BusinessVertical"    = "CorpIT"
    "SDOCode"             = "8561"
    "CCCode"              = "180"
    "ProvisioningSR"      = "CHG0082390"
    "PID"                 = "shared"
    "Department"          = "shared"
    "Stack"               = "Prod"
    "ProvisionedBy"       = "Terraform"
    "supportcost"         = "$"
    "ServiceType"         = "IAAS"
    "Backup"              = "Daily"
    "DeploymentType"      = "NN"
    "Exception"           = "No"
    "InstanceSchedule"    = "24*7"
    "RI"                  = "TBD"
    "ScheduleforDeletion" = "No"
  }

  dev-jump-vm-tags = {
    "ApplicationSupport"  = "genpactcloudsupport@genpact.com"
    "OwnerSupervisor"     = "santhosh.srihari@genpact.com"
    "Owner"               = "Ankur.Singhal@genpact.com"
    "ProjectName"         = "CORP Europe Azure Landing Zone"
    "BusinessVertical"    = "CorpIT"
    "SDOCode"             = "8561"
    "CCCode"              = "180"
    "ProvisioningSR"      = "CHG0082390"
    "PID"                 = "shared"
    "Department"          = "shared"
    "Stack"               = "Dev"
    "ProvisionedBy"       = "Terraform"
    "supportcost"         = "$"
    "ServiceType"         = "IAAS"
    "Backup"              = "Daily"
    "DeploymentType"      = "NN"
    "Exception"           = "No"
    "InstanceSchedule"    = "24*7"
    "RI"                  = "TBD"
    "ScheduleforDeletion" = "No"
  }
  okta-vm-tags = {
    "ApplicationSupport"  = "GenpactOktaAdmins@genpactonline.onmicrosoft.com"
    "OwnerSupervisor"     = "pankaj.chugh@genpact.com"
    "Owner"               = "chandrasekhar.babu@genpact.com"
    "ProjectName"         = "CORP Europe Azure Landing Zone"
    "BusinessVertical"    = "CorpIT"
    "SDOCode"             = "8561"
    "CCCode"              = "180"
    "ProvisioningSR"      = "CHG0082390"
    "PID"                 = "shared"
    "Department"          = "shared"
    "Stack"               = "Prod"
    "ProvisionedBy"       = "Terraform"
    "supportcost"         = "$"
    "ServiceType"         = "IAAS"
    "Backup"              = "Daily"
    "DeploymentType"      = "NN"
    "Exception"           = "No"
    "InstanceSchedule"    = "24*7"
    "RI"                  = "TBD"
    "ScheduleforDeletion" = "No"
  }
  ad-vm-tags = {
    "ApplicationSupport"  = "GenpactWintelL3SupportTeam@genpact.com"
    "OwnerSupervisor"     = "vinay.goel@genpact.com"
    "Owner"               = "pavnesh.kumar@genpact.com"
    "ProjectName"         = "CORP Europe Azure Landing Zone"
    "BusinessVertical"    = "CorpIT"
    "SDOCode"             = "8561"
    "CCCode"              = "180"
    "ProvisioningSR"      = "CHG0082390"
    "PID"                 = "shared"
    "Department"          = "shared"
    "Stack"               = "Prod"
    "ProvisionedBy"       = "Terraform"
    "supportcost"         = "$"
    "ServiceType"         = "IAAS"
    "Backup"              = "Daily"
    "DeploymentType"      = "NN"
    "Exception"           = "No"
    "InstanceSchedule"    = "24*7"
    "RI"                  = "TBD"
    "ScheduleforDeletion" = "No"
  }

  paas_tags = {
    "Exception"           = "No"
    "schedulefordeletion" = "No"
    "ServiceType"         = "PAAS"
    "supportcost"         = "$"
    "ProvisionedBy"       = "Terraform"
    "Owner"               = "ravinder.bhati@genpact.com"
  }


  paas_sa_tags = {
    "Exception"           = "Yes"
    "schedulefordeletion" = "No"
    "ServiceType"         = "PAAS"
    "supportcost"         = "$"
    "ProvisionedBy"       = "Terraform"
    "Owner"               = "anandarao.veyyakula@genpact.com"
  }

  # Maximum 15 tags for priavte dns zones.
  paas_dns_tags = {
    "Exception"   = "No"
    "ServiceType" = "PAAS"
  }

  location_ind_tag = {
    "Location" = "Central India"
  }

  location_weu_tag = {
    "Location" = "West Europe"

  }

  location_wus_tag = {
    "Location" = "West US"

  }

  location_neu_tag = {
    "Location" = "North Europe"
  }
}







locals {

  ind_dctags = {

    corp-rg-ind-prod-shared-identity-core-adc = {

      "ApplicationSupport" = "GenpactWintelL3SupportTeam@genpact.com"
      "OwnerSupervisor"    = "vinay.goel@genpact.com"
      "Owner"              = "pavnesh.kumar@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

    corp-rg-ind-prod-shared-identity-core-okta = {

      "ApplicationSupport" = "GenpactOktaAdmins@genpactonline.onmicrosoft.com"
      "OwnerSupervisor"    = "pankaj.chugh@genpact.com"
      "Owner"              = "chandrasekhar.babu@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }
    corp-rg-ind-dev-shared-identity-core-adc = {
      "ApplicationSupport" = "GenpactWintelL3SupportTeam@genpact.com"
      "OwnerSupervisor"    = "vinay.goel@genpact.com"
      "Owner"              = "pavnesh.kumar@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }
    corp-rg-ind-dev-shared-identity-core-okta = {
      "ApplicationSupport" = "GenpactOktaAdmins@genpactonline.onmicrosoft.com"
      "OwnerSupervisor"    = "pankaj.chugh@genpact.com"
      "Owner"              = "chandrasekhar.babu@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

  }

  neu_dctags = {

    corp-rg-neu-prod-shared-identity-core-adc = {

      "ApplicationSupport" = "GenpactWintelL3SupportTeam@genpact.com"
      "OwnerSupervisor"    = "vinay.goel@genpact.com"
      "Owner"              = "pavnesh.kumar@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

    corp-rg-neu-prod-shared-identity-core-okta = {

      "ApplicationSupport" = "GenpactOktaAdmins@genpactonline.onmicrosoft.com"
      "OwnerSupervisor"    = "pankaj.chugh@genpact.com"
      "Owner"              = "chandrasekhar.babu@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }
    corp-rg-neu-dev-shared-identity-core-adc = {
      "ApplicationSupport" = "GenpactWintelL3SupportTeam@genpact.com"
      "OwnerSupervisor"    = "vinay.goel@genpact.com"
      "Owner"              = "pavnesh.kumar@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }
    corp-rg-neu-dev-shared-identity-core-okta = {
      "ApplicationSupport" = "GenpactOktaAdmins@genpactonline.onmicrosoft.com"
      "OwnerSupervisor"    = "pankaj.chugh@genpact.com"
      "Owner"              = "chandrasekhar.babu@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

  }

  weu_dctags = {

    corp-rg-weu-prod-shared-identity-core-adc = {

      "ApplicationSupport" = "GenpactWintelL3SupportTeam@genpact.com"
      "OwnerSupervisor"    = "vinay.goel@genpact.com"
      "Owner"              = "pavnesh.kumar@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

    corp-rg-weu-prod-shared-identity-core-okta = {

      "ApplicationSupport" = "GenpactOktaAdmins@genpactonline.onmicrosoft.com"
      "OwnerSupervisor"    = "pankaj.chugh@genpact.com"
      "Owner"              = "chandrasekhar.babu@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }
    corp-rg-weu-dev-shared-identity-core-adc = {
      "ApplicationSupport" = "GenpactWintelL3SupportTeam@genpact.com"
      "OwnerSupervisor"    = "vinay.goel@genpact.com"
      "Owner"              = "pavnesh.kumar@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }
    corp-rg-weu-dev-shared-identity-core-okta = {
      "ApplicationSupport" = "GenpactOktaAdmins@genpactonline.onmicrosoft.com"
      "OwnerSupervisor"    = "pankaj.chugh@genpact.com"
      "Owner"              = "chandrasekhar.babu@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

  }

  wus_dctags = {

    corp-rg-wus-prod-shared-identity-core-adc = {

      "ApplicationSupport" = "GenpactWintelL3SupportTeam@genpact.com"
      "OwnerSupervisor"    = "vinay.goel@genpact.com"
      "Owner"              = "pavnesh.kumar@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

    corp-rg-wus-prod-shared-identity-core-okta = {

      "ApplicationSupport" = "GenpactOktaAdmins@genpactonline.onmicrosoft.com"
      "OwnerSupervisor"    = "pankaj.chugh@genpact.com"
      "Owner"              = "chandrasekhar.babu@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }
    corp-rg-wus-dev-shared-identity-core-adc = {
      "ApplicationSupport" = "GenpactWintelL3SupportTeam@genpact.com"
      "OwnerSupervisor"    = "vinay.goel@genpact.com"
      "Owner"              = "pavnesh.kumar@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }
    corp-rg-wus-dev-shared-identity-core-okta = {
      "ApplicationSupport" = "GenpactOktaAdmins@genpactonline.onmicrosoft.com"
      "OwnerSupervisor"    = "pankaj.chugh@genpact.com"
      "Owner"              = "chandrasekhar.babu@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

  }


}


locals {
  weu_rsv_tags = {
    corp-rg-weu-prod-shared-management-core-rsv = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"

    }
    corp-rg-weu-dev-shared-management-core-rsv = {

      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"

    }
  }
  weu_rsv_identity_tags = {
    corp-rg-weu-prod-shared-identity-core-rsv = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }
    corp-rg-weu-dev-shared-identity-core-rsv = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }
  }
  weu_rsv_prod_tags = {
    corp-rg-weu-prod-tis-core-rsv = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "tis-shared"
      "Department"         = "tis"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }
    corp-rg-weu-prod-tas-core-rsv = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "191"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "tas-shared"
      "Department"         = "tas"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }
  }
  weu_rsv_dev_tags = {
    corp-rg-weu-dev-tis-core-rsv = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "tis-shared"
      "Department"         = "tis"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }
    corp-rg-weu-dev-tas-core-rsv = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "191"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "tas-shared"
      "Department"         = "tas"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }
  }
  weu_rsv_uat_tags = {
    corp-rg-weu-uat-tis-core-rsv = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "tis-shared"
      "Department"         = "tis"
      "Stack"              = "UAT"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }
    corp-rg-weu-uat-tas-core-rsv = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "191"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "tas-shared"
      "Department"         = "tas"
      "Stack"              = "UAT"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }
  }
}


locals {


  ind_zpa_tags = {


    corp-rg-ind-prod-shared-management-core-zpa = {

      "ApplicationSupport" = "GenpactProxySupport@genpact.com"
      "OwnerSupervisor"    = "mohit.rawat2@genpact.com"
      "Owner"              = "sandeep.singh7@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"


    }

    corp-rg-ind-dev-shared-management-core-zpa = {

      "ApplicationSupport" = "GenpactProxySupport@genpact.com"
      "OwnerSupervisor"    = "mohit.rawat2@genpact.com"
      "Owner"              = "sandeep.singh7@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"




    }
  }

  neu_zpa_tags = {

    corp-rg-neu-prod-shared-management-core-zpa = {

      "ApplicationSupport" = "GenpactProxySupport@genpact.com"
      "OwnerSupervisor"    = "mohit.rawat2@genpact.com"
      "Owner"              = "sandeep.singh7@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"


    }

    corp-rg-neu-dev-shared-management-core-zpa = {

      "ApplicationSupport" = "GenpactProxySupport@genpact.com"
      "OwnerSupervisor"    = "mohit.rawat2@genpact.com"
      "Owner"              = "sandeep.singh7@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"



    }
  }

  weu_zpa_tags = {

    corp-rg-weu-prod-shared-management-core-zpa = {

      "ApplicationSupport" = "GenpactProxySupport@genpact.com"
      "OwnerSupervisor"    = "mohit.rawat2@genpact.com"
      "Owner"              = "sandeep.singh7@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"


    }

    corp-rg-weu-dev-shared-management-core-zpa = {

      "ApplicationSupport" = "GenpactProxySupport@genpact.com"
      "OwnerSupervisor"    = "mohit.rawat2@genpact.com"
      "Owner"              = "sandeep.singh7@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"


    }
  }


  wus_zpa_tags = {


    corp-rg-wus-prod-shared-management-core-zpa = {

      "ApplicationSupport" = "GenpactProxySupport@genpact.com"
      "OwnerSupervisor"    = "mohit.rawat2@genpact.com"
      "Owner"              = "sandeep.singh7@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"


    }

    corp-rg-wus-dev-shared-management-core-zpa = {

      "ApplicationSupport" = "GenpactProxySupport@genpact.com"
      "OwnerSupervisor"    = "mohit.rawat2@genpact.com"
      "Owner"              = "sandeep.singh7@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"

    }


  }

}

//********************************* SECURITY TAGS***********************

locals {

  security_subscription_tags = {

    corp-rg-weu-prod-shared-security-analytics-log = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "amarendra.yadava@genpact.com"
      "Owner"              = "sumeet.kumar2@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "shared"
      "Department"         = "prod-shared"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

    corp-rg-weu-dev-shared-security-analytics-log = {

      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "amarendra.yadava@genpact.com"
      "Owner"              = "sumeet.kumar2@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "shared"
      "Department"         = "dev-shared"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

    corp-rg-weu-prod-shared-flowlog-storage = {

      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "amarendra.yadava@genpact.com"
      "Owner"              = "sumeet.kumar2@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "shared"
      "Department"         = "prod-shared"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

    corp-rg-weu-dev-shared-flowlog-storage = {

      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "amarendra.yadava@genpact.com"
      "Owner"              = "sumeet.kumar2@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "shared"
      "Department"         = "Dev-shared"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

  }
}


locals {
  private_dns_zone_tags = {
    corp-rg-weu-prod-shared-private-dns-zone = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "prod-shared"
      "Department"         = "shared"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }
    corp-rg-weu-dev-shared-private-dns-zone = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "dev-shared"
      "Department"         = "shared"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }
  }
}
//********************************************

locals {

  ind_lmc_tags = {


    corp-rg-ind-prod-shared-management-core-lmc = {
      "ApplicationSupport" = "genpactnmgtoolsteam@genpact.com"
      "OwnerSupervisor"    = "Steven.Zhang@genpact.com"
      "Owner"              = "venkataganeshbabu.k@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }
    corp-rg-ind-dev-shared-management-core-lmc = {
      "ApplicationSupport" = "genpactnmgtoolsteam@genpact.com"
      "OwnerSupervisor"    = "Steven.Zhang@genpact.com"
      "Owner"              = "venkataganeshbabu.k@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }


  }


  neu_lmc_tags = {


    corp-rg-neu-prod-shared-management-core-lmc = {
      "ApplicationSupport" = "genpactnmgtoolsteam@genpact.com"
      "OwnerSupervisor"    = "Steven.Zhang@genpact.com"
      "Owner"              = "venkataganeshbabu.k@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }
    corp-rg-neu-dev-shared-management-core-lmc = {
      "ApplicationSupport" = "genpactnmgtoolsteam@genpact.com"
      "OwnerSupervisor"    = "Steven.Zhang@genpact.com"
      "Owner"              = "venkataganeshbabu.k@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }


  }



  weu_lmc_tags = {


    corp-rg-weu-prod-shared-management-core-lmc = {
      "ApplicationSupport" = "genpactnmgtoolsteam@genpact.com"
      "OwnerSupervisor"    = "Steven.Zhang@genpact.com"
      "Owner"              = "venkataganeshbabu.k@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }
    corp-rg-weu-dev-shared-management-core-lmc = {
      "ApplicationSupport" = "genpactnmgtoolsteam@genpact.com"
      "OwnerSupervisor"    = "Steven.Zhang@genpact.com"
      "Owner"              = "venkataganeshbabu.k@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }


  }



  wus_lmc_tags = {


    corp-rg-wus-prod-shared-management-core-lmc = {
      "ApplicationSupport" = "genpactnmgtoolsteam@genpact.com"
      "OwnerSupervisor"    = "Steven.Zhang@genpact.com"
      "Owner"              = "venkataganeshbabu.k@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }
    corp-rg-wus-dev-shared-management-core-lmc = {
      "ApplicationSupport" = "genpactnmgtoolsteam@genpact.com"
      "OwnerSupervisor"    = "Steven.Zhang@genpact.com"
      "Owner"              = "venkataganeshbabu.k@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }


  }
}


locals {


  ind_jmp_server_tags = {

    corp-rg-ind-prod-shared-management-core-jmp = {

      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "Ankur.Singhal@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }
    corp-rg-ind-dev-shared-management-core-jmp = {

      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "Ankur.Singhal@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }


  }

  neu_jmp_server_tags = {

    corp-rg-neu-prod-shared-management-core-jmp = {

      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "Ankur.Singhal@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }
    corp-rg-neu-dev-shared-management-core-jmp = {

      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "Ankur.Singhal@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }


  }



  weu_jmp_server_tags = {

    corp-rg-weu-prod-shared-management-core-jmp = {

      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "Ankur.Singhal@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }
    corp-rg-weu-dev-shared-management-core-jmp = {

      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "Ankur.Singhal@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }


  }



  wus_jmp_server_tags = {

    corp-rg-wus-prod-shared-management-core-jmp = {

      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "Ankur.Singhal@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }
    corp-rg-wus-dev-shared-management-core-jmp = {

      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "Ankur.Singhal@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }


  }

}


locals {



  weu_bootdiag_tags = {


    corp-rg-weu-prod-shared-boot-diag = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

    corp-rg-weu-dev-shared-boot-diag = {

      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }
    corp-rg-weu-prod-shared-security-bootdiag = {

      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }
    corp-rg-weu-prod-shared-management-bootdiag = {

      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }
    corp-rg-weu-dev-shared-management-bootdiag = {

      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }
    corp-rg-weu-prod-shared-identity-bootdiag = {

      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }
    corp-rg-weu-dev-shared-identity-bootdiag = {

      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

    corp-rg-weu-prod-tas-bootdiag = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "tas-shared"
      "Department"         = "tas"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

    corp-rg-weu-prod-tis-bootdiag = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "tis-shared"
      "Department"         = "tis"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

    corp-rg-weu-dev-tas-bootdiag = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "tas-shared"
      "Department"         = "tas"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

    corp-rg-weu-dev-tis-bootdiag = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "tis-shared"
      "Department"         = "tis"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }
    corp-rg-weu-uat-tas-bootdiag = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "tas-shared"
      "Department"         = "tas"
      "Stack"              = "UAT"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }
    corp-rg-weu-uat-tis-bootdiag = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "tis-shared"
      "Department"         = "tis"
      "Stack"              = "UAT"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }
  }



  neu_bootdiag_tags = {


    corp-rg-neu-prod-shared-boot-diag = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

    corp-rg-neu-dev-shared-boot-diag = {

      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

    corp-rg-neu-prod-tas-boot-diag = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "tas-shared"
      "Department"         = "tas"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

    corp-rg-neu-prod-tis-boot-diag = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "tis-shared"
      "Department"         = "tis"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

    corp-rg-neu-dev-tas-boot-diag = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "tas-shared"
      "Department"         = "tas"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

    corp-rg-neu-dev-tis-boot-diag = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "tis-shared"
      "Department"         = "tis"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

  }


  ind_bootdiag_tags = {


    corp-rg-ind-prod-shared-boot-diag = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

    corp-rg-ind-dev-shared-boot-diag = {

      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

    corp-rg-ind-prod-tas-boot-diag = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "tas-shared"
      "Department"         = "tas"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

    corp-rg-ind-prod-tis-boot-diag = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "tis-shared"
      "Department"         = "tis"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

    corp-rg-ind-dev-tas-boot-diag = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "tas-shared"
      "Department"         = "tas"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

    corp-rg-ind-dev-tis-boot-diag = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "tis-shared"
      "Department"         = "tis"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

  }




  wus_bootdiag_tags = {


    corp-rg-wus-prod-shared-boot-diag = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

    corp-rg-wus-dev-shared-boot-diag = {

      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

    corp-rg-wus-prod-tas-boot-diag = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "tas-shared"
      "Department"         = "tas"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

    corp-rg-wus-prod-tis-boot-diag = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "tis-shared"
      "Department"         = "tis"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

    corp-rg-wus-dev-tas-boot-diag = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "tas-shared"
      "Department"         = "tas"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

    corp-rg-wus-dev-tis-boot-diag = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "tis-shared"
      "Department"         = "tis"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }
  }
}

locals {

  prod_log_tags = {
    "ApplicationSupport" = "genpactcloudsupport@genpact.com"
    "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
    "Owner"              = "anandarao.veyyakula@genpact.com"
    "ProjectName"        = "CORP Europe Azure Landing Zone"
    "BusinessVertical"   = "CorpIT"
    "SDOCode"            = "8561"
    "CCCode"             = "180"
    "ProvisioningSR"     = "CHG0082390"
    "PID"                = "shared"
    "Department"         = "shared"
    "Stack"              = "Prod"
    "ProvisionedBy"      = "Terraform"
    "supportcost"        = "$"
  }

  dev_log_tags = {
    "ApplicationSupport" = "genpactcloudsupport@genpact.com"
    "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
    "Owner"              = "anandarao.veyyakula@genpact.com"
    "ProjectName"        = "CORP Europe Azure Landing Zone"
    "BusinessVertical"   = "CorpIT"
    "SDOCode"            = "8561"
    "CCCode"             = "180"
    "ProvisioningSR"     = "CHG0082390"
    "PID"                = "shared"
    "Department"         = "shared"
    "Stack"              = "Dev"
    "ProvisionedBy"      = "Terraform"
    "supportcost"        = "$"
  }

  weu_akv_tags = {

    corp-rg-weu-uat-tis-akv = {

      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "tis-shared"
      "Department"         = "tis"
      "Stack"              = "UAT"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"

    }

    corp-rg-weu-uat-tas-akv = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "tas-shared"
      "Department"         = "tas"
      "Stack"              = "UAT"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

    corp-rg-weu-prod-tis-akv = {

      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "tis-shared"
      "Department"         = "tis"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"

    }

    corp-rg-weu-prod-tas-akv = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "tas-shared"
      "Department"         = "tas"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

    corp-rg-weu-prod-shared-security-akv = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

    corp-rg-weu-prod-shared-management-akv = {

      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"

    }

    corp-rg-weu-dev-shared-management-akv = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

    corp-rg-weu-dev-tis-akv = {

      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "tis-shared"
      "Department"         = "tis"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"

    }

    corp-rg-weu-dev-tas-akv = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "tas-shared"
      "Department"         = "tas"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

    corp-rg-weu-prod-shared-identity-akv = {

      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"

    }

    corp-rg-weu-dev-shared-identity-akv = {

      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"

    }
  }
  neu_akv_tags = {


    corp-rg-neu-prod-shared-management-core-akv = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

    corp-rg-neu-dev-shared-management-core-akv = {

      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"

    }
  }
  ind_akv_tags = {


    corp-rg-ind-prod-shared-management-core-akv = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

    corp-rg-ind-dev-shared-management-core-akv = {

      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }
  }
  wus_akv_tags = {


    corp-rg-wus-prod-shared-management-core-akv = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

    corp-rg-wus-dev-shared-management-core-akv = {

      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "CORP Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0082390"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"

    }
  }
}
