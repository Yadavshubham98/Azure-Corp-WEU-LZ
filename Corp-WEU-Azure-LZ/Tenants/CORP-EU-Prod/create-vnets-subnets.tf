
# //Weu Platformss
# resource "azurerm_virtual_network" "corp-weu-shared-connectivity" {
#   provider            = azurerm.weu-connectivity-sub
#   name                = "corp-weu-shared-connectivity"
#   location            = var.location-weu
#   resource_group_name = azurerm_resource_group.corp-rg-weu-shared-connectivity-core-network.name
#   address_space       = ["/23"]
#   tags                = local.prod_shared_network_tags
# }

resource "azurerm_virtual_network" "corp-weu-shared-internet" {
  provider            = azurerm.weu-connectivity-sub
  name                = "corp-weu-shared-internet"
  location            = var.location-weu
  resource_group_name = azurerm_resource_group.corp-rg-weu-prod-shared-connectivity-zcc-network.name
  address_space       = ["10.251.90.0/23"]
  tags                = local.prod_shared_zcc_tags
}

resource "azurerm_virtual_network" "corp-weu-prod-shared-management" {
  provider            = azurerm.weu-management-sub
  name                = "corp-weu-prod-shared-management"
  location            = var.location-weu
  resource_group_name = azurerm_resource_group.corp-rg-weu-prod-shared-management-core-network.name
  address_space       = ["10.251.0.0/23"]
  tags                = local.prod_shared_network_tags

}

resource "azurerm_virtual_network" "corp-weu-dev-shared-management" {
  provider            = azurerm.weu-management-sub
  name                = "corp-weu-dev-shared-management"
  location            = var.location-weu
  resource_group_name = azurerm_resource_group.corp-rg-weu-dev-shared-management-core-network.name
  address_space       = ["10.251.2.0/23"]
  tags                = local.dev_shared_network_tags
}

resource "azurerm_virtual_network" "corp-weu-prod-shared-identity" {
  provider            = azurerm.weu-identity-sub
  name                = "corp-weu-prod-shared-identity"
  location            = var.location-weu
  resource_group_name = azurerm_resource_group.corp-rg-weu-shared-prod-identity-core-network.name
  address_space       = ["10.251.4.0/23"]
  tags                = local.prod_shared_network_tags

}



resource "azurerm_virtual_network" "corp-weu-dev-shared-identity" {
  provider            = azurerm.weu-identity-sub
  name                = "corp-weu-dev-shared-identity"
  location            = var.location-weu
  resource_group_name = azurerm_resource_group.corp-rg-weu-shared-dev-identity-core-network.name
  address_space       = ["10.251.6.0/23"]
  tags                = local.paas_tags
}

//weu Landing Zone VNETS

resource "azurerm_virtual_network" "corp-weu-prod-tis" {
  provider            = azurerm.weu-prod-tis-sub
  name                = "corp-weu-prod-tis"
  location            = var.location-weu
  resource_group_name = azurerm_resource_group.corp-rg-weu-prod-tis-core-network.name
  address_space       = ["10.251.8.0/22"]
  tags                = local.prod_tis_network_tags
}

resource "azurerm_virtual_network" "corp-weu-prod-tas" {
  provider            = azurerm.weu-prod-tas-sub
  name                = "corp-weu-prod-tas"
  location            = var.location-weu
  resource_group_name = azurerm_resource_group.corp-rg-weu-prod-tas-core-network.name
  address_space       = ["10.251.16.0/22"]
  tags                = local.prod_tas_network_tags

}
resource "azurerm_virtual_network" "corp-weu-dev-tis" {
  provider            = azurerm.weu-dev-tis-sub
  name                = "corp-weu-dev-tis"
  location            = var.location-weu
  resource_group_name = azurerm_resource_group.corp-rg-weu-dev-tis-core-network.name
  address_space       = ["10.251.14.0/23"]
  tags                = local.dev_tis_network_tags

}
resource "azurerm_virtual_network" "corp-weu-dev-tas" {
  provider            = azurerm.weu-dev-tas-sub
  name                = "corp-weu-dev-tas"
  location            = var.location-weu
  resource_group_name = azurerm_resource_group.corp-rg-weu-dev-tas-core-network.name
  address_space       = ["10.251.22.0/23"]
  tags                = local.dev_tas_network_tags

}
resource "azurerm_virtual_network" "corp-weu-uat-tis" {
  provider            = azurerm.weu-uat-tis-sub
  name                = "corp-weu-uat-tis"
  location            = var.location-weu
  resource_group_name = azurerm_resource_group.corp-rg-weu-uat-tis-core-network.name
  address_space       = ["10.251.12.0/23"]
  tags                = local.uat_tis_network_tags

}
resource "azurerm_virtual_network" "corp-weu-uat-tas" {
  provider            = azurerm.weu-uat-tas-sub
  name                = "corp-weu-uat-tas"
  location            = var.location-weu
  resource_group_name = azurerm_resource_group.corp-rg-weu-uat-tas-core-network.name
  address_space       = ["10.251.20.0/23"]
  tags                = local.uat_tas_network_tags

}


// *********************************** WEST EUROPE REGION SUBNETS ***************************

//Create Subnets for Platform Resources East Us region

resource "azurerm_subnet" "corp-weu-prod-management-subnet" {
  provider             = azurerm.weu-management-sub
  count                = length(local.weu-prod-management-subnet_name)
  name                 = local.weu-prod-management-subnet_name[count.index]
  resource_group_name  = azurerm_resource_group.corp-rg-weu-prod-shared-management-core-network.name
  virtual_network_name = azurerm_virtual_network.corp-weu-prod-shared-management.name
  address_prefixes     = [local.weu-prod-management-subnet_address_prefixes[count.index]]
  service_endpoints    = ["Microsoft.Storage", "Microsoft.KeyVault"]
  lifecycle {
    ignore_changes = [
      service_endpoints,
      enforce_private_link_endpoint_network_policies,
    ]
  }
}
resource "azurerm_subnet" "corp-weu-dev-management-subnet" {
  provider             = azurerm.weu-management-sub
  count                = length(local.weu-dev-management-subnet_name)
  name                 = local.weu-dev-management-subnet_name[count.index]
  resource_group_name  = azurerm_resource_group.corp-rg-weu-dev-shared-management-core-network.name //dev
  virtual_network_name = azurerm_virtual_network.corp-weu-dev-shared-management.name                //dev subnet will be inside prod vnet
  address_prefixes     = [local.weu-dev-management-subnet_address_prefixes[count.index]]
  service_endpoints    = ["Microsoft.Storage", "Microsoft.KeyVault"]
  lifecycle {
    ignore_changes = [
      service_endpoints,
      enforce_private_link_endpoint_network_policies,
    ]
  }
}


resource "azurerm_subnet" "corp-weu-prod-identity-subnet" {
  provider             = azurerm.weu-identity-sub
  count                = length(local.weu-prod-identity-subnet_name)
  name                 = local.weu-prod-identity-subnet_name[count.index]
  resource_group_name  = azurerm_resource_group.corp-rg-weu-shared-prod-identity-core-network.name
  virtual_network_name = azurerm_virtual_network.corp-weu-prod-shared-identity.name
  address_prefixes     = [local.weu-prod-identity-subnet_address_prefixes[count.index]]
  service_endpoints    = ["Microsoft.Storage", "Microsoft.KeyVault"]
  # lifecycle {
  #   ignore_changes = [service_endpoints]
  # }
}

resource "azurerm_subnet" "corp-weu-dev-identity-subnet" {
  provider             = azurerm.weu-identity-sub
  count                = length(local.weu-dev-identity-subnet_name)
  name                 = local.weu-dev-identity-subnet_name[count.index]
  resource_group_name  = azurerm_resource_group.corp-rg-weu-shared-dev-identity-core-network.name
  virtual_network_name = azurerm_virtual_network.corp-weu-dev-shared-identity.name
  address_prefixes     = [local.weu-dev-identity-subnet_address_prefixes[count.index]]
  service_endpoints    = ["Microsoft.Storage", "Microsoft.KeyVault"]
  # lifecycle {
  #   ignore_changes = [service_endpoints]
  # }
}

// WEU Region 

resource "azurerm_subnet" "corp-weu-prod-tis-subnet" {
  provider             = azurerm.weu-prod-tis-sub
  count                = length(local.weu-prod-tis-subnet-name)
  name                 = local.weu-prod-tis-subnet-name[count.index]
  resource_group_name  = azurerm_resource_group.corp-rg-weu-prod-tis-core-network.name
  virtual_network_name = azurerm_virtual_network.corp-weu-prod-tis.name
  address_prefixes     = [local.weu-prod-tis-subnet[count.index]]
  service_endpoints    = ["Microsoft.Storage", "Microsoft.KeyVault"]
  # lifecycle {
  #   ignore_changes = [service_endpoints]
  # }
}
resource "azurerm_subnet" "corp-weu-prod-tas-subnet" {
  provider             = azurerm.weu-prod-tas-sub
  count                = length(local.weu-prod-tas-subnet-name)
  name                 = local.weu-prod-tas-subnet-name[count.index]
  resource_group_name  = azurerm_resource_group.corp-rg-weu-prod-tas-core-network.name
  virtual_network_name = azurerm_virtual_network.corp-weu-prod-tas.name
  address_prefixes     = [local.weu-prod-tas-subnet[count.index]]
  service_endpoints    = ["Microsoft.Storage", "Microsoft.KeyVault"]
  # lifecycle {
  #   ignore_changes = [service_endpoints]
  # }
}
resource "azurerm_subnet" "corp-weu-dev-tis-subnet" {
  provider             = azurerm.weu-dev-tis-sub
  count                = length(local.weu-dev-tis-subnet-name)
  name                 = local.weu-dev-tis-subnet-name[count.index]
  resource_group_name  = azurerm_resource_group.corp-rg-weu-dev-tis-core-network.name
  virtual_network_name = azurerm_virtual_network.corp-weu-dev-tis.name
  address_prefixes     = [local.weu-dev-tis-subnet[count.index]]
  service_endpoints    = ["Microsoft.Storage", "Microsoft.KeyVault"]
  # lifecycle {
  #   ignore_changes = [service_endpoints]
  # }
}
resource "azurerm_subnet" "corp-weu-dev-tas-subnet" {
  provider             = azurerm.weu-dev-tas-sub
  count                = length(local.weu-dev-tas-subnet-name)
  name                 = local.weu-dev-tas-subnet-name[count.index]
  resource_group_name  = azurerm_resource_group.corp-rg-weu-dev-tas-core-network.name
  virtual_network_name = azurerm_virtual_network.corp-weu-dev-tas.name
  address_prefixes     = [local.weu-dev-tas-subnet[count.index]]
  service_endpoints    = ["Microsoft.Storage", "Microsoft.KeyVault"]
  # lifecycle {
  #   ignore_changes = [service_endpoints]
  # }
}
resource "azurerm_subnet" "corp-weu-uat-tis-subnet" {
  provider             = azurerm.weu-uat-tis-sub
  count                = length(local.weu-uat-tis-subnet-name)
  name                 = local.weu-uat-tis-subnet-name[count.index]
  resource_group_name  = azurerm_resource_group.corp-rg-weu-uat-tis-core-network.name
  virtual_network_name = azurerm_virtual_network.corp-weu-uat-tis.name
  address_prefixes     = [local.weu-uat-tis-subnet[count.index]]
  service_endpoints    = ["Microsoft.Storage", "Microsoft.KeyVault"]
  # lifecycle {
  #   ignore_changes = [service_endpoints]
  # }
}
resource "azurerm_subnet" "corp-weu-uat-tas-subnet" {
  provider             = azurerm.weu-uat-tas-sub
  count                = length(local.weu-uat-tas-subnet-name)
  name                 = local.weu-uat-tas-subnet-name[count.index]
  resource_group_name  = azurerm_resource_group.corp-rg-weu-uat-tas-core-network.name
  virtual_network_name = azurerm_virtual_network.corp-weu-uat-tas.name
  address_prefixes     = [local.weu-uat-tas-subnet[count.index]]
  service_endpoints    = ["Microsoft.Storage", "Microsoft.KeyVault"]
  # lifecycle {
  #   ignore_changes = [service_endpoints]
  # }
}
