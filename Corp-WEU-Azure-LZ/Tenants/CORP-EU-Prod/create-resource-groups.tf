
resource "azurerm_resource_group" "corp-rg-weu-shared-connectivity-core-network" {
  provider = azurerm.weu-connectivity-sub
  name     = "corp-rg-weu-prod-shared-connectivity-core-network"
  location = var.location-weu
  tags     = local.prod_shared_network_tags
}

resource "azurerm_resource_group" "corp-rg-weu-prod-shared-connectivity-zcc-network" {
  provider = azurerm.weu-connectivity-sub
  name     = "corp-rg-weu-prod-shared-connectivity-zcc-network"
  location = var.location-weu
  tags     = local.weu_zpa_tags["corp-rg-weu-prod-shared-management-core-zpa"]
}

resource "azurerm_resource_group" "corp-rg-weu-prod-shared-connectivity-zcc-01" {
  provider = azurerm.weu-connectivity-sub
  name     = "corp-rg-weu-prod-shared-connectivity-zcc-01"
  location = var.location-weu
  tags     = local.weu_zpa_tags["corp-rg-weu-prod-shared-management-core-zpa"]
}


resource "azurerm_resource_group" "corp-rg-weu-dev-shared-management-core-network" {
  provider = azurerm.weu-management-sub
  name     = "corp-rg-weu-dev-shared-management-core-network"
  location = var.location-weu
  tags     = local.dev_shared_network_tags
}
resource "azurerm_resource_group" "corp-rg-weu-prod-shared-management-core-network" {
  provider = azurerm.weu-management-sub
  name     = "corp-rg-weu-prod-shared-management-core-network"
  location = var.location-weu
  tags     = local.prod_shared_network_tags
}
resource "azurerm_resource_group" "corp-rg-weu-shared-dev-identity-core-network" {
  provider = azurerm.weu-identity-sub
  name     = "corp-rg-weu-dev-shared-identity-core-network"
  location = var.location-weu
  tags     = local.dev_shared_network_tags
}
resource "azurerm_resource_group" "corp-rg-weu-shared-prod-identity-core-network" {
  provider = azurerm.weu-identity-sub
  name     = "corp-rg-weu-prod-shared-identity-core-network"
  location = var.location-weu
  tags     = local.prod_shared_network_tags
}


//Landing Zones
resource "azurerm_resource_group" "corp-rg-weu-prod-tis-core-network" {
  provider = azurerm.weu-prod-tis-sub
  name     = "corp-rg-weu-prod-tis-core-network"
  location = var.location-weu

  tags = local.prod_tis_network_tags
}
resource "azurerm_resource_group" "corp-rg-weu-prod-tas-core-network" {
  provider = azurerm.weu-prod-tas-sub
  name     = "corp-rg-weu-prod-tas-core-network"
  location = var.location-weu
  tags     = local.prod_tas_network_tags
}
resource "azurerm_resource_group" "corp-rg-weu-dev-tis-core-network" {
  provider = azurerm.weu-dev-tis-sub
  name     = "corp-rg-weu-dev-tis-core-network"
  location = var.location-weu
  tags     = local.dev_tis_network_tags
}
resource "azurerm_resource_group" "corp-rg-weu-dev-tas-core-network" {
  provider = azurerm.weu-dev-tas-sub
  name     = "corp-rg-weu-dev-tas-core-network"
  location = var.location-weu
  tags     = local.dev_tas_network_tags
}
resource "azurerm_resource_group" "corp-rg-weu-uat-tis-core-network" {
  provider = azurerm.weu-uat-tis-sub
  name     = "corp-rg-weu-uat-tis-core-network"
  location = var.location-weu
  tags     = local.uat_tis_network_tags
}
resource "azurerm_resource_group" "corp-rg-weu-uat-tas-core-network" {
  provider = azurerm.weu-uat-tas-sub
  name     = "corp-rg-weu-uat-tas-core-network"
  location = var.location-weu
  tags     = local.uat_tas_network_tags
}

resource "azurerm_resource_group" "weu-identity-rgs" {
  provider = azurerm.weu-identity-sub
  count    = length(local.weu-identity-rgs)
  name     = local.weu-identity-rgs[count.index]
  location = var.location-weu
  tags     = local.weu_dctags[local.weu-identity-rgs[count.index]]
}

// Resource Groups for Logic Monitor Servers

resource "azurerm_resource_group" "weu-lmc-rgs" {
  provider = azurerm.weu-management-sub
  count    = length(local.weu-lmc-rgs)
  name     = local.weu-lmc-rgs[count.index]
  location = var.location-weu
  tags     = local.weu_lmc_tags[local.weu-lmc-rgs[count.index]]
}

//Resource Groups for Jump servers

resource "azurerm_resource_group" "weu-jmp-rgs" {
  provider = azurerm.weu-management-sub
  count    = length(local.weu-jmp-rgs)
  name     = local.weu-jmp-rgs[count.index]
  location = var.location-weu
  tags     = local.weu_jmp_server_tags[local.weu-jmp-rgs[count.index]]
}


//Resource Groups for ZPA servers


resource "azurerm_resource_group" "weu-zpa-rgs" {
  provider = azurerm.weu-management-sub
  count    = length(local.weu-zpa-rgs)
  name     = local.weu-zpa-rgs[count.index]
  location = var.location-weu
  tags     = local.weu_zpa_tags[local.weu-zpa-rgs[count.index]]
}

//Azure KeyVault Resource Groups

resource "azurerm_resource_group" "weu-uat-tis-akv-rg" {
  provider = azurerm.weu-uat-tis-sub
  name     = local.weu-akv-rgs[0]
  location = var.location-weu
  tags     = local.weu_akv_tags[local.weu-akv-rgs[0]]
}

resource "azurerm_resource_group" "weu-uat-tas-akv-rg" {
  provider = azurerm.weu-uat-tas-sub
  name     = local.weu-akv-rgs[1]
  location = var.location-weu
  tags     = local.weu_akv_tags[local.weu-akv-rgs[1]]
}

resource "azurerm_resource_group" "weu-prod-tis-akv-rg" {
  provider = azurerm.weu-prod-tis-sub
  name     = local.weu-akv-rgs[2]
  location = var.location-weu
  tags     = local.weu_akv_tags[local.weu-akv-rgs[2]]
}

resource "azurerm_resource_group" "weu-prod-tas-akv-rg" {
  provider = azurerm.weu-prod-tas-sub
  name     = local.weu-akv-rgs[3]
  location = var.location-weu
  tags     = local.weu_akv_tags[local.weu-akv-rgs[3]]
}

resource "azurerm_resource_group" "weu-prod-shared-security-akv-rg" {
  provider = azurerm.weu-security-sub
  name     = local.weu-akv-rgs[4]
  location = var.location-weu
  tags     = local.weu_akv_tags[local.weu-akv-rgs[4]]
}

resource "azurerm_resource_group" "weu-prod-shared-management-akv-rg" {
  provider = azurerm.weu-management-sub
  name     = local.weu-akv-rgs[5]
  location = var.location-weu
  tags     = local.weu_akv_tags[local.weu-akv-rgs[5]]
}

resource "azurerm_resource_group" "weu-dev-shared-management-akv-rg" {
  provider = azurerm.weu-management-sub
  name     = local.weu-akv-rgs[6]
  location = var.location-weu
  tags     = local.weu_akv_tags[local.weu-akv-rgs[6]]
}

resource "azurerm_resource_group" "weu-dev-tis-akv-rg" {
  provider = azurerm.weu-dev-tis-sub
  name     = local.weu-akv-rgs[7]
  location = var.location-weu
  tags     = local.weu_akv_tags[local.weu-akv-rgs[7]]
}

resource "azurerm_resource_group" "weu-dev-tas-akv-rg" {
  provider = azurerm.weu-dev-tas-sub
  name     = local.weu-akv-rgs[8]
  location = var.location-weu
  tags     = local.weu_akv_tags[local.weu-akv-rgs[8]]
}

resource "azurerm_resource_group" "weu-prod-shared-identity-akv-rg" {
  provider = azurerm.weu-identity-sub
  name     = local.weu-akv-rgs[9]
  location = var.location-weu
  tags     = local.weu_akv_tags[local.weu-akv-rgs[9]]
}

resource "azurerm_resource_group" "weu-dev-shared-identity-akv-rg" {
  provider = azurerm.weu-identity-sub
  name     = local.weu-akv-rgs[10]
  location = var.location-weu
  tags     = local.weu_akv_tags[local.weu-akv-rgs[10]]
}


//Recovery Services Vault

resource "azurerm_resource_group" "weu-rsv-rgs" {
  provider = azurerm.weu-management-sub
  count    = length(local.weu-rsv-rgs)
  name     = local.weu-rsv-rgs[count.index]
  location = var.location-weu
  tags     = local.weu_rsv_tags[local.weu-rsv-rgs[count.index]]
}

resource "azurerm_resource_group" "weu-rsv-identity-rgs" {
  provider = azurerm.weu-identity-sub
  count    = length(local.weu-rsv-identity-rgs)
  name     = local.weu-rsv-identity-rgs[count.index]
  location = var.location-weu
  tags     = local.weu_rsv_identity_tags[local.weu-rsv-identity-rgs[count.index]]
}

resource "azurerm_resource_group" "weu-rsv-prod-rgs" {
  provider = azurerm.weu-prod-tis-sub
  count    = length(local.weu-rsv-prod-rgs)
  name     = local.weu-rsv-prod-rgs[count.index]
  location = var.location-weu
  tags     = local.weu_rsv_prod_tags[local.weu-rsv-prod-rgs[count.index]]
}

resource "azurerm_resource_group" "weu-rsv-dev-rgs" {
  provider = azurerm.weu-dev-tis-sub
  count    = length(local.weu-rsv-dev-rgs)
  name     = local.weu-rsv-dev-rgs[count.index]
  location = var.location-weu
  tags     = local.weu_rsv_dev_tags[local.weu-rsv-dev-rgs[count.index]]
}

resource "azurerm_resource_group" "weu-rsv-uat-rgs" {
  provider = azurerm.weu-uat-tis-sub
  count    = length(local.weu-rsv-uat-rgs)
  name     = local.weu-rsv-uat-rgs[count.index]
  location = var.location-weu
  tags     = local.weu_rsv_uat_tags[local.weu-rsv-uat-rgs[count.index]]
}

//Boot Diagnostics Resource Groups

resource "azurerm_resource_group" "weu-uat-tis-bootdiagnostics-rg" {
  provider = azurerm.weu-uat-tis-sub
  name     = local.weu-bootdiag-rgs[0]
  location = var.location-weu
  tags     = local.weu_bootdiag_tags[local.weu-bootdiag-rgs[0]]
}
resource "azurerm_resource_group" "weu-uat-tas-bootdiagnostics-rg" {
  provider = azurerm.weu-uat-tas-sub
  name     = local.weu-bootdiag-rgs[1]
  location = var.location-weu
  tags     = local.weu_bootdiag_tags[local.weu-bootdiag-rgs[1]]
}
resource "azurerm_resource_group" "weu-prod-tis-bootdiagnostics-rg" {
  provider = azurerm.weu-prod-tis-sub
  name     = local.weu-bootdiag-rgs[2]
  location = var.location-weu
  tags     = local.weu_bootdiag_tags[local.weu-bootdiag-rgs[2]]
}
resource "azurerm_resource_group" "weu-prod-tas-bootdiagnostics-rg" {
  provider = azurerm.weu-prod-tas-sub
  name     = local.weu-bootdiag-rgs[3]
  location = var.location-weu
  tags     = local.weu_bootdiag_tags[local.weu-bootdiag-rgs[3]]
}
resource "azurerm_resource_group" "weu-prod-shared-security-bootdiagnostics-rg" {
  provider = azurerm.weu-security-sub
  name     = local.weu-bootdiag-rgs[4]
  location = var.location-weu
  tags     = local.weu_bootdiag_tags[local.weu-bootdiag-rgs[4]]
}

resource "azurerm_resource_group" "weu-prod-shared-management-bootdiagnostics-rg" {
  provider = azurerm.weu-management-sub
  name     = local.weu-bootdiag-rgs[5]
  location = var.location-weu
  tags     = local.weu_bootdiag_tags[local.weu-bootdiag-rgs[5]]
}
resource "azurerm_resource_group" "weu-dev-shared-management-bootdiagnostics-rg" {
  provider = azurerm.weu-management-sub
  name     = local.weu-bootdiag-rgs[6]
  location = var.location-weu
  tags     = local.weu_bootdiag_tags[local.weu-bootdiag-rgs[6]]
}
resource "azurerm_resource_group" "weu-dev-tis-bootdiagnostics-rg" {
  provider = azurerm.weu-dev-tis-sub
  name     = local.weu-bootdiag-rgs[7]
  location = var.location-weu
  tags     = local.weu_bootdiag_tags[local.weu-bootdiag-rgs[7]]
}
resource "azurerm_resource_group" "weu-dev-tas-bootdiagnostics-rg" {
  provider = azurerm.weu-dev-tas-sub
  name     = local.weu-bootdiag-rgs[8]
  location = var.location-weu
  tags     = local.weu_bootdiag_tags[local.weu-bootdiag-rgs[8]]
}
resource "azurerm_resource_group" "weu-prod-shared-identity-bootdiagnostics-rg" {
  provider = azurerm.weu-identity-sub
  name     = local.weu-bootdiag-rgs[9]
  location = var.location-weu
  tags     = local.weu_bootdiag_tags[local.weu-bootdiag-rgs[9]]
}
resource "azurerm_resource_group" "weu-dev-shared-identity-bootdiagnostics-rg" {
  provider = azurerm.weu-identity-sub
  name     = local.weu-bootdiag-rgs[10]
  location = var.location-weu
  tags     = local.weu_bootdiag_tags[local.weu-bootdiag-rgs[10]]
}

//Log Analytics Resource Groups

# resource "azurerm_resource_group" "weu-la-workspace-rg" {
#   provider = azurerm.weu-management-sub
#   name     = local.all-regions-laworkspace-rg[2]
#   location = var.location-weu
#   tags     = local.prod_log_tags
# }



//++++++++++++++++++++++++++++++++++++ Security Subscription RGS +++++++++++++++++++++++++++++++++++++

resource "azurerm_resource_group" "weu-security-logs-rgs" {
  provider = azurerm.weu-security-sub
  count    = length(local.security-subscription-rg)
  name     = local.security-subscription-rg[count.index]
  location = var.location-weu
  tags     = local.security_subscription_tags[local.security-subscription-rg[count.index]]
}


resource "azurerm_resource_group" "weu-private-dns-zone-rgs" {
  provider = azurerm.weu-identity-sub
  count    = length(local.private-dns-zone-rg)
  name     = local.private-dns-zone-rg[count.index]
  location = var.location-weu
  tags     = local.private_dns_zone_tags[local.private-dns-zone-rg[count.index]]
}


resource "azurerm_resource_group" "NetworkWatcherRG-ProdEU" {
  provider = azurerm.weu-prod-tis-sub
  name     = "NetworkWatcherRG"
  location = var.location-weu
  tags     = local.weu_bootdiag_tags[local.weu-bootdiag-rgs[2]]
}


resource "azurerm_resource_group" "NetworkWatcherRG-DevEU" {
  provider = azurerm.weu-dev-tis-sub
  name     = "NetworkWatcherRG"
  location = var.location-weu
  tags     = local.weu_bootdiag_tags[local.weu-bootdiag-rgs[7]]
}


resource "azurerm_resource_group" "NetworkWatcherRG-UatEU" {
  provider = azurerm.weu-uat-tis-sub
  name     = "NetworkWatcherRG"
  location = var.location-weu
  tags     = local.weu_bootdiag_tags[local.weu-bootdiag-rgs[0]]
}
