
# //WEU NSG and associations

resource "azurerm_network_security_group" "weu-prod-management-subnet-nsg" {
  count               = length(local.weu-prod-management-subnet_name)
  name                = "${local.weu-prod-management-subnet_name[count.index]}-nsg"
  location            = var.location-weu
  provider            = azurerm.weu-management-sub
  depends_on          = [azurerm_resource_group.corp-rg-weu-prod-shared-management-core-network, azurerm_subnet.corp-weu-prod-management-subnet]
  resource_group_name = azurerm_resource_group.corp-rg-weu-prod-shared-management-core-network.name

  security_rule {
    name                       = "Deny_All_Inbound"
    description                = "Deny_All_Inbound"
    priority                   = 4096
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  # security_rule {
  #   name                       = "keyvault"
  #   description                = "Allow access to Key Vault"
  #   priority                   = 100
  #   direction                  = "Inbound"
  #   access                     = "Allow"
  #   protocol                   = "*"
  #   source_port_range          = "*"
  #   destination_port_range     = "*"
  #   source_address_prefix      = "10.251.130.0/23" # Example: Set the appropriate IP range
  #   destination_address_prefix = "*"               # Example: Set the appropriate IP range
  # }

  tags = local.prod_shared_network_tags

  lifecycle {
    ignore_changes = [
      security_rule,

    ]
  }

}

data "azurerm_network_watcher" "nwatchermanagement" {
  provider            = azurerm.weu-management-sub
  name                = "NetworkWatcher_westeurope"
  resource_group_name = "NetworkWatcherRG"
}

data "azurerm_log_analytics_workspace" "corp-la-weu-workspace" {
  provider            = azurerm.weu-security-sub
  name                = "corp-la-weu-workspace"
  resource_group_name = "corp-rg-weu-prod-shared-security-analytics-log"
}

resource "azurerm_network_watcher_flow_log" "corp-snet-weu-prod-management-NSG-flowlog" {
  count                     = length(local.weu-prod-management-subnet_name)
  provider                  = azurerm.weu-management-sub
  network_watcher_name      = data.azurerm_network_watcher.nwatchermanagement.name
  resource_group_name       = data.azurerm_network_watcher.nwatchermanagement.resource_group_name
  name                      = "${local.weu-prod-management-subnet_name[count.index]}-nsg-flowlog"
  network_security_group_id = azurerm_network_security_group.weu-prod-management-subnet-nsg[count.index].id
  storage_account_id        = azurerm_storage_account.corpstorweupsecflowlog.id
  enabled                   = true

  retention_policy {
    enabled = true
    days    = 2
  }
  version = 2

  traffic_analytics {
    enabled               = true
    workspace_id          = data.azurerm_log_analytics_workspace.corp-la-weu-workspace.workspace_id
    workspace_region      = data.azurerm_log_analytics_workspace.corp-la-weu-workspace.location
    workspace_resource_id = data.azurerm_log_analytics_workspace.corp-la-weu-workspace.id
    interval_in_minutes   = 10
  }
  tags = local.security_subscription_tags[local.security-subscription-rg[0]]

  lifecycle {
    ignore_changes = [
      location,
    ]
  }

}


resource "azurerm_network_security_group" "weu-dev-management-subnet-nsg" {
  provider            = azurerm.weu-management-sub
  count               = length(local.weu-dev-management-subnet_name)
  name                = "${local.weu-dev-management-subnet_name[count.index]}-nsg"
  location            = var.location-weu
  resource_group_name = azurerm_resource_group.corp-rg-weu-dev-shared-management-core-network.name
  depends_on          = [azurerm_subnet.corp-weu-dev-management-subnet]

  security_rule {
    name                       = "Deny_All_Inbound"
    description                = "Deny_All_Inbound"
    priority                   = 4096
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  # security_rule {
  #   name                       = "keyvault"
  #   description                = "Allow access to Key Vault"
  #   priority                   = 100
  #   direction                  = "Inbound"
  #   access                     = "Allow"
  #   protocol                   = "*"
  #   source_port_range          = "*"
  #   destination_port_range     = "*"
  #   source_address_prefix      = "10.251.154.0/23" # Example: Set the appropriate IP range
  #   destination_address_prefix = "*"               # Example: Set the appropriate IP range
  # }

  tags = local.dev_shared_network_tags
  lifecycle {
    ignore_changes = [
      security_rule,
    ]
  }

}


resource "azurerm_network_watcher_flow_log" "corp-snet-weu-dev-management-NSG-flowlog" {
  count                     = length(local.weu-dev-management-subnet_name)
  provider                  = azurerm.weu-management-sub
  network_watcher_name      = data.azurerm_network_watcher.nwatchermanagement.name
  resource_group_name       = data.azurerm_network_watcher.nwatchermanagement.resource_group_name
  name                      = "${local.weu-dev-management-subnet_name[count.index]}-nsg-flowlog"
  network_security_group_id = azurerm_network_security_group.weu-dev-management-subnet-nsg[count.index].id
  storage_account_id        = azurerm_storage_account.corpstorweudsecflowlog.id
  enabled                   = true

  retention_policy {
    enabled = true
    days    = 2
  }
  version = 2

  traffic_analytics {
    enabled               = true
    workspace_id          = data.azurerm_log_analytics_workspace.corp-la-weu-workspace.workspace_id
    workspace_region      = data.azurerm_log_analytics_workspace.corp-la-weu-workspace.location
    workspace_resource_id = data.azurerm_log_analytics_workspace.corp-la-weu-workspace.id
    interval_in_minutes   = 10
  }
  tags = local.security_subscription_tags[local.security-subscription-rg[1]]
  lifecycle {
    ignore_changes = [
      location,
    ]
  }
}


resource "azurerm_network_security_group" "weu-prod-identity-subnet-nsg" {
  count               = length(local.weu-prod-identity-subnet_name)
  name                = "${local.weu-prod-identity-subnet_name[count.index]}-nsg"
  location            = var.location-weu
  provider            = azurerm.weu-identity-sub
  depends_on          = [azurerm_subnet.corp-weu-prod-identity-subnet]
  resource_group_name = azurerm_resource_group.corp-rg-weu-shared-prod-identity-core-network.name

  security_rule {
    name                       = "Deny_All_Inbound"
    description                = "Deny_All_Inbound"
    priority                   = 4096
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  # security_rule {
  #   name                       = "keyvault"
  #   description                = "Allow access to Key Vault"
  #   priority                   = 100
  #   direction                  = "Inbound"
  #   access                     = "Allow"
  #   protocol                   = "*"
  #   source_port_range          = "*"
  #   destination_port_range     = "*"
  #   source_address_prefix      = "10.251.132.0/23" # Example: Set the appropriate IP range
  #   destination_address_prefix = "*"               # Example: Set the appropriate IP range
  # }

  tags = local.prod_shared_network_tags

  lifecycle {
    ignore_changes = [
      security_rule,
    ]
  }

}

data "azurerm_network_watcher" "nwatcheridentity" {
  provider            = azurerm.weu-identity-sub
  name                = "NetworkWatcher_westeurope"
  resource_group_name = "NetworkWatcherRG"
}

resource "azurerm_network_watcher_flow_log" "corp-snet-weu-prod-identity-NSG-flowlog" {
  count                     = length(local.weu-prod-identity-subnet_name)
  provider                  = azurerm.weu-identity-sub
  network_watcher_name      = data.azurerm_network_watcher.nwatcheridentity.name
  resource_group_name       = data.azurerm_network_watcher.nwatcheridentity.resource_group_name
  name                      = "${local.weu-prod-identity-subnet_name[count.index]}-nsg-flowlog"
  network_security_group_id = azurerm_network_security_group.weu-prod-identity-subnet-nsg[count.index].id
  storage_account_id        = azurerm_storage_account.corpstorweupsecflowlog.id
  enabled                   = true

  retention_policy {
    enabled = true
    days    = 2
  }
  version = 2

  traffic_analytics {
    enabled               = true
    workspace_id          = data.azurerm_log_analytics_workspace.corp-la-weu-workspace.workspace_id
    workspace_region      = data.azurerm_log_analytics_workspace.corp-la-weu-workspace.location
    workspace_resource_id = data.azurerm_log_analytics_workspace.corp-la-weu-workspace.id
    interval_in_minutes   = 10
  }
  tags = local.security_subscription_tags[local.security-subscription-rg[0]]
  lifecycle {
    ignore_changes = [
      location,
    ]
  }
}


resource "azurerm_network_security_group" "weu-dev-identity-subnet-nsg" {
  count               = length(local.weu-dev-identity-subnet_name)
  provider            = azurerm.weu-identity-sub
  name                = "${local.weu-dev-identity-subnet_name[count.index]}-nsg"
  location            = var.location-weu
  resource_group_name = azurerm_resource_group.corp-rg-weu-shared-dev-identity-core-network.name
  depends_on          = [azurerm_subnet.corp-weu-dev-identity-subnet]
  security_rule {
    name                       = "Deny_All_Inbound"
    description                = "Deny_All_Inbound"
    priority                   = 4096
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  tags = local.dev_shared_network_tags

  lifecycle {
    ignore_changes = [
      security_rule,
    ]
  }
}


resource "azurerm_network_watcher_flow_log" "corp-snet-weu-dev-identity-NSG-flowlog" {
  count                     = length(local.weu-dev-identity-subnet_name)
  provider                  = azurerm.weu-identity-sub
  network_watcher_name      = data.azurerm_network_watcher.nwatcheridentity.name
  resource_group_name       = data.azurerm_network_watcher.nwatcheridentity.resource_group_name
  name                      = "${local.weu-dev-identity-subnet_name[count.index]}-nsg-flowlog"
  network_security_group_id = azurerm_network_security_group.weu-dev-identity-subnet-nsg[count.index].id
  storage_account_id        = azurerm_storage_account.corpstorweudsecflowlog.id
  enabled                   = true

  retention_policy {
    enabled = true
    days    = 2
  }
  version = 2

  traffic_analytics {
    enabled               = true
    workspace_id          = data.azurerm_log_analytics_workspace.corp-la-weu-workspace.workspace_id
    workspace_region      = data.azurerm_log_analytics_workspace.corp-la-weu-workspace.location
    workspace_resource_id = data.azurerm_log_analytics_workspace.corp-la-weu-workspace.id
    interval_in_minutes   = 10
  }
  tags = local.security_subscription_tags[local.security-subscription-rg[0]]
  lifecycle {
    ignore_changes = [
      location,
    ]
  }
}


# //weu


resource "azurerm_network_security_group" "weu-prod-tis-nsg" {
  count               = length(local.weu-prod-tis-subnet-name)
  name                = "${local.weu-prod-tis-subnet-name[count.index]}-nsg"
  location            = var.location-weu
  provider            = azurerm.weu-prod-tis-sub
  depends_on          = [azurerm_subnet.corp-weu-prod-tis-subnet]
  resource_group_name = azurerm_resource_group.corp-rg-weu-prod-tis-core-network.name

  security_rule {
    name                       = "Deny_All_Inbound"
    description                = "Deny_All_Inbound"
    priority                   = 4096
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  # security_rule {
  #   name                       = "keyvault"
  #   description                = "Allow access to Key Vault"
  #   priority                   = 100
  #   direction                  = "Inbound"
  #   access                     = "Allow"
  #   protocol                   = "*"
  #   source_port_range          = "*"
  #   destination_port_range     = "*"
  #   source_address_prefix      = "10.251.136.0/22" # Example: Set the appropriate IP range
  #   destination_address_prefix = "*"               # Example: Set the appropriate IP range
  # }

  tags = local.prod_tis_network_tags
  lifecycle {
    ignore_changes = [
      security_rule,
    ]
  }

}

resource "azurerm_network_watcher" "nwatcherprodeu" {
  provider            = azurerm.weu-prod-tis-sub
  location            = var.location-weu
  name                = "NetworkWatcher_westeurope"
  resource_group_name = azurerm_resource_group.NetworkWatcherRG-ProdEU.name
  depends_on          = [azurerm_resource_group.NetworkWatcherRG-ProdEU]
  lifecycle {
    ignore_changes = [
      tags,
    ]
  }
}

resource "azurerm_network_watcher_flow_log" "corp-snet-weu-prod-tis-NSG-flowlog" {
  count                     = length(local.weu-prod-tis-subnet-name)
  provider                  = azurerm.weu-prod-tis-sub
  network_watcher_name      = azurerm_network_watcher.nwatcherprodeu.name
  resource_group_name       = azurerm_network_watcher.nwatcherprodeu.resource_group_name
  name                      = "${local.weu-prod-tis-subnet-name[count.index]}-nsg-flowlog"
  network_security_group_id = azurerm_network_security_group.weu-prod-tis-nsg[count.index].id
  storage_account_id        = azurerm_storage_account.corpstorweupsecflowlog.id
  enabled                   = true
  depends_on                = [azurerm_network_watcher.nwatcherprodeu]
  retention_policy {
    enabled = true
    days    = 2
  }
  version = 2

  traffic_analytics {
    enabled               = true
    workspace_id          = data.azurerm_log_analytics_workspace.corp-la-weu-workspace.workspace_id
    workspace_region      = data.azurerm_log_analytics_workspace.corp-la-weu-workspace.location
    workspace_resource_id = data.azurerm_log_analytics_workspace.corp-la-weu-workspace.id
    interval_in_minutes   = 10
  }
  tags = local.security_subscription_tags[local.security-subscription-rg[0]]
  lifecycle {
    ignore_changes = [
      location,
    ]
  }
}


resource "azurerm_network_security_group" "weu-prod-tas-nsg" {
  provider            = azurerm.weu-prod-tas-sub
  count               = length(local.weu-prod-tas-subnet-name)
  name                = "${local.weu-prod-tas-subnet-name[count.index]}-nsg"
  location            = var.location-weu
  depends_on          = [azurerm_subnet.corp-weu-prod-tas-subnet]
  resource_group_name = azurerm_resource_group.corp-rg-weu-prod-tas-core-network.name

  security_rule {
    name                       = "Deny_All_Inbound"
    description                = "Deny_All_Inbound"
    priority                   = 4096
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  # security_rule {
  #   name                       = "keyvault"
  #   description                = "Allow access to Key Vault"
  #   priority                   = 100
  #   direction                  = "Inbound"
  #   access                     = "Allow"
  #   protocol                   = "*"
  #   source_port_range          = "*"
  #   destination_port_range     = "*"
  #   source_address_prefix      = "10.251.136.0/22" # Example: Set the appropriate IP range
  #   destination_address_prefix = "*"               # Example: Set the appropriate IP range
  # }
  tags = local.prod_tas_network_tags
  lifecycle {
    ignore_changes = [
      security_rule,
    ]
  }

}

resource "azurerm_network_watcher_flow_log" "corp-snet-weu-prod-tas-NSG-flowlog" {
  count                     = length(local.weu-prod-tas-subnet-name)
  provider                  = azurerm.weu-prod-tis-sub
  network_watcher_name      = azurerm_network_watcher.nwatcherprodeu.name
  resource_group_name       = azurerm_network_watcher.nwatcherprodeu.resource_group_name
  name                      = "${local.weu-prod-tas-subnet-name[count.index]}-nsg-flowlog"
  network_security_group_id = azurerm_network_security_group.weu-prod-tas-nsg[count.index].id
  storage_account_id        = azurerm_storage_account.corpstorweupsecflowlog.id
  enabled                   = true
  depends_on                = [azurerm_network_watcher.nwatcherprodeu]
  retention_policy {
    enabled = true
    days    = 2
  }
  version = 2

  traffic_analytics {
    enabled               = true
    workspace_id          = data.azurerm_log_analytics_workspace.corp-la-weu-workspace.workspace_id
    workspace_region      = data.azurerm_log_analytics_workspace.corp-la-weu-workspace.location
    workspace_resource_id = data.azurerm_log_analytics_workspace.corp-la-weu-workspace.id
    interval_in_minutes   = 10
  }
  tags = local.security_subscription_tags[local.security-subscription-rg[0]]
  lifecycle {
    ignore_changes = [
      location,
    ]
  }
}



resource "azurerm_network_security_group" "weu-dev-tis-nsg" {
  count               = length(local.weu-dev-tis-subnet-name)
  provider            = azurerm.weu-dev-tis-sub
  name                = "${local.weu-dev-tis-subnet-name[count.index]}-nsg"
  location            = var.location-weu
  depends_on          = [azurerm_subnet.corp-weu-prod-tis-subnet]
  resource_group_name = azurerm_resource_group.corp-rg-weu-dev-tis-core-network.name

  security_rule {
    name                       = "Deny_All_Inbound"
    description                = "Deny_All_Inbound"
    priority                   = 4096
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  # security_rule {
  #   name                       = "keyvault"
  #   description                = "Allow access to Key Vault"
  #   priority                   = 100
  #   direction                  = "Inbound"
  #   access                     = "Allow"
  #   protocol                   = "*"
  #   source_port_range          = "*"
  #   destination_port_range     = "*"
  #   source_address_prefix      = "10.251.142.0/23" # Example: Set the appropriate IP range
  #   destination_address_prefix = "*"               # Example: Set the appropriate IP range
  # }
  tags = local.dev_tis_network_tags
  lifecycle {
    ignore_changes = [
      security_rule,
    ]
  }

}


resource "azurerm_network_watcher" "nwatcherdeveu" {
  provider            = azurerm.weu-dev-tis-sub
  name                = "NetworkWatcher_westeurope"
  resource_group_name = azurerm_resource_group.NetworkWatcherRG-DevEU.name
  location            = var.location-weu
  depends_on          = [azurerm_resource_group.NetworkWatcherRG-DevEU]
  lifecycle {
    ignore_changes = [
      tags,
    ]
  }
}

resource "azurerm_network_watcher_flow_log" "corp-snet-weu-dev-tis-NSG-flowlog" {
  count                     = length(local.weu-dev-tis-subnet-name)
  provider                  = azurerm.weu-dev-tis-sub
  network_watcher_name      = azurerm_network_watcher.nwatcherdeveu.name
  resource_group_name       = azurerm_network_watcher.nwatcherdeveu.resource_group_name
  name                      = "${local.weu-dev-tis-subnet-name[count.index]}-nsg-flowlog"
  network_security_group_id = azurerm_network_security_group.weu-dev-tis-nsg[count.index].id
  storage_account_id        = azurerm_storage_account.corpstorweudsecflowlog.id
  enabled                   = true
  depends_on                = [azurerm_network_watcher.nwatcherdeveu]
  retention_policy {
    enabled = true
    days    = 2
  }
  version = 2

  traffic_analytics {
    enabled               = true
    workspace_id          = data.azurerm_log_analytics_workspace.corp-la-weu-workspace.workspace_id
    workspace_region      = data.azurerm_log_analytics_workspace.corp-la-weu-workspace.location
    workspace_resource_id = data.azurerm_log_analytics_workspace.corp-la-weu-workspace.id
    interval_in_minutes   = 10
  }
  tags = local.security_subscription_tags[local.security-subscription-rg[1]]
  lifecycle {
    ignore_changes = [
      location,
    ]
  }
}



resource "azurerm_network_security_group" "weu-dev-tas-nsg" {
  provider            = azurerm.weu-dev-tas-sub
  count               = length(local.weu-dev-tas-subnet-name)
  name                = "${local.weu-dev-tas-subnet-name[count.index]}-nsg"
  location            = var.location-weu
  depends_on          = [azurerm_subnet.corp-weu-dev-tas-subnet]
  resource_group_name = azurerm_resource_group.corp-rg-weu-dev-tas-core-network.name

  security_rule {
    name                       = "Deny_All_Inbound"
    description                = "Deny_All_Inbound"
    priority                   = 4096
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  # security_rule {
  #   name                       = "keyvault"
  #   description                = "Allow access to Key Vault"
  #   priority                   = 100
  #   direction                  = "Inbound"
  #   access                     = "Allow"
  #   protocol                   = "*"
  #   source_port_range          = "*"
  #   destination_port_range     = "*"
  #   source_address_prefix      = "10.251.150.0/23" # Example: Set the appropriate IP range
  #   destination_address_prefix = "*"               # Example: Set the appropriate IP range
  # }
  tags = local.dev_tas_network_tags
  lifecycle {
    ignore_changes = [
      security_rule,
    ]
  }

}


resource "azurerm_network_watcher_flow_log" "corp-snet-weu-dev-tas-NSG-flowlog" {
  count                     = length(local.weu-dev-tas-subnet-name)
  provider                  = azurerm.weu-dev-tas-sub
  network_watcher_name      = azurerm_network_watcher.nwatcherdeveu.name
  resource_group_name       = azurerm_network_watcher.nwatcherdeveu.resource_group_name
  name                      = "${local.weu-dev-tas-subnet-name[count.index]}-nsg-flowlog"
  network_security_group_id = azurerm_network_security_group.weu-dev-tas-nsg[count.index].id
  storage_account_id        = azurerm_storage_account.corpstorweudsecflowlog.id
  enabled                   = true
  depends_on                = [azurerm_network_watcher.nwatcherdeveu]
  retention_policy {
    enabled = true
    days    = 2
  }
  version = 2

  traffic_analytics {
    enabled               = true
    workspace_id          = data.azurerm_log_analytics_workspace.corp-la-weu-workspace.workspace_id
    workspace_region      = data.azurerm_log_analytics_workspace.corp-la-weu-workspace.location
    workspace_resource_id = data.azurerm_log_analytics_workspace.corp-la-weu-workspace.id
    interval_in_minutes   = 10
  }
  tags = local.security_subscription_tags[local.security-subscription-rg[1]]
  lifecycle {
    ignore_changes = [
      location,
    ]
  }
}


# // UAT Environment.

resource "azurerm_network_security_group" "weu-uat-tis-nsg" {
  provider            = azurerm.weu-uat-tis-sub
  count               = length(local.weu-uat-tis-subnet-name)
  name                = "${local.weu-uat-tis-subnet-name[count.index]}-nsg"
  location            = var.location-weu
  depends_on          = [azurerm_subnet.corp-weu-uat-tis-subnet]
  resource_group_name = azurerm_resource_group.corp-rg-weu-uat-tis-core-network.name

  security_rule {
    name                       = "Deny_All_Inbound"
    description                = "Deny_All_Inbound"
    priority                   = 4096
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"

  }

  # security_rule {
  #   name                       = "keyvault"
  #   description                = "Allow access to Key Vault"
  #   priority                   = 100
  #   direction                  = "Inbound"
  #   access                     = "Allow"
  #   protocol                   = "*"
  #   source_port_range          = "*"
  #   destination_port_range     = "*"
  #   source_address_prefix      = "10.251.140.0/23" # Example: Set the appropriate IP range
  #   destination_address_prefix = "*"               # Example: Set the appropriate IP range
  # }
  tags = local.uat_tis_network_tags
  lifecycle {
    ignore_changes = [
      security_rule,
    ]
  }

}


resource "azurerm_network_watcher" "nwatcheruateu" {
  provider            = azurerm.weu-uat-tis-sub
  name                = "NetworkWatcher_westeurope"
  resource_group_name = azurerm_resource_group.NetworkWatcherRG-UatEU.name
  location            = var.location-weu
  depends_on          = [azurerm_resource_group.NetworkWatcherRG-UatEU]
  lifecycle {
    ignore_changes = [
      tags,
    ]
  }
}


resource "azurerm_network_watcher_flow_log" "corp-snet-weu-uat-tis-NSG-flowlog" {
  count                     = length(local.weu-uat-tis-subnet-name)
  provider                  = azurerm.weu-uat-tis-sub
  network_watcher_name      = azurerm_network_watcher.nwatcheruateu.name
  resource_group_name       = azurerm_network_watcher.nwatcheruateu.resource_group_name
  name                      = "${local.weu-uat-tis-subnet-name[count.index]}-nsg-flowlog"
  network_security_group_id = azurerm_network_security_group.weu-uat-tis-nsg[count.index].id
  storage_account_id        = azurerm_storage_account.corpstorweupsecflowlog.id
  enabled                   = true
  depends_on                = [azurerm_network_watcher.nwatcheruateu]
  retention_policy {
    enabled = true
    days    = 2
  }
  version = 2

  traffic_analytics {
    enabled               = true
    workspace_id          = data.azurerm_log_analytics_workspace.corp-la-weu-workspace.workspace_id
    workspace_region      = data.azurerm_log_analytics_workspace.corp-la-weu-workspace.location
    workspace_resource_id = data.azurerm_log_analytics_workspace.corp-la-weu-workspace.id
    interval_in_minutes   = 10
  }
  tags = local.security_subscription_tags[local.security-subscription-rg[0]]
  lifecycle {
    ignore_changes = [
      location,
    ]
  }
}



resource "azurerm_network_security_group" "weu-uat-tas-nsg" {
  provider            = azurerm.weu-uat-tas-sub
  count               = length(local.weu-uat-tas-subnet-name)
  name                = "${local.weu-uat-tas-subnet-name[count.index]}-nsg"
  location            = var.location-weu
  depends_on          = [azurerm_subnet.corp-weu-uat-tas-subnet]
  resource_group_name = azurerm_resource_group.corp-rg-weu-uat-tas-core-network.name

  security_rule {
    name                       = "Deny_All_Inbound"
    description                = "Deny_All_Inbound"
    priority                   = 4096
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"

  }

  # security_rule {
  #   name                       = "keyvault"
  #   description                = "Allow access to Key Vault"
  #   priority                   = 100
  #   direction                  = "Inbound"
  #   access                     = "Allow"
  #   protocol                   = "*"
  #   source_port_range          = "*"
  #   destination_port_range     = "*"
  #   source_address_prefix      = "10.251.148.0/23" # Example: Set the appropriate IP range
  #   destination_address_prefix = "*"               # Example: Set the appropriate IP range
  # }
  tags = local.uat_tis_network_tags
  lifecycle {
    ignore_changes = [
      security_rule,
    ]
  }

}

resource "azurerm_network_watcher_flow_log" "corp-snet-weu-uat-tas-NSG-flowlog" {
  count                     = length(local.weu-uat-tas-subnet-name)
  provider                  = azurerm.weu-uat-tas-sub
  network_watcher_name      = azurerm_network_watcher.nwatcheruateu.name
  resource_group_name       = azurerm_network_watcher.nwatcheruateu.resource_group_name
  name                      = "${local.weu-uat-tas-subnet-name[count.index]}-nsg-flowlog"
  network_security_group_id = azurerm_network_security_group.weu-uat-tas-nsg[count.index].id
  storage_account_id        = azurerm_storage_account.corpstorweupsecflowlog.id
  enabled                   = true
  depends_on                = [azurerm_network_watcher.nwatcheruateu]
  retention_policy {
    enabled = true
    days    = 2
  }
  version = 2

  traffic_analytics {
    enabled               = true
    workspace_id          = data.azurerm_log_analytics_workspace.corp-la-weu-workspace.workspace_id
    workspace_region      = data.azurerm_log_analytics_workspace.corp-la-weu-workspace.location
    workspace_resource_id = data.azurerm_log_analytics_workspace.corp-la-weu-workspace.id
    interval_in_minutes   = 10
  }
  tags = local.security_subscription_tags[local.security-subscription-rg[0]]
  lifecycle {
    ignore_changes = [
      location,
    ]
  }
}




# //weu subnets associations.


resource "azurerm_subnet_network_security_group_association" "weu-prod-management-subnet-nsg" {
  provider                  = azurerm.weu-management-sub
  count                     = length(local.weu-prod-management-subnet_name)
  subnet_id                 = azurerm_subnet.corp-weu-prod-management-subnet[count.index].id
  network_security_group_id = azurerm_network_security_group.weu-prod-management-subnet-nsg[count.index].id
  depends_on                = [azurerm_network_security_group.weu-prod-management-subnet-nsg]
  lifecycle {
    ignore_changes = [
      network_security_group_id,
      subnet_id,
    ]
  }
}

resource "azurerm_subnet_network_security_group_association" "weu-dev-management-subnet-nsg" {
  provider                  = azurerm.weu-management-sub
  count                     = length(local.weu-dev-management-subnet_name)
  subnet_id                 = azurerm_subnet.corp-weu-dev-management-subnet[count.index].id
  network_security_group_id = azurerm_network_security_group.weu-dev-management-subnet-nsg[count.index].id
  depends_on                = [azurerm_network_security_group.weu-dev-management-subnet-nsg]
  lifecycle {
    ignore_changes = [
      network_security_group_id,
      subnet_id,
    ]
  }

}


resource "azurerm_subnet_network_security_group_association" "weu-prod-identity-subnet-nsg" {
  provider                  = azurerm.weu-identity-sub
  count                     = length(local.weu-prod-identity-subnet_name)
  subnet_id                 = azurerm_subnet.corp-weu-prod-identity-subnet[count.index].id
  network_security_group_id = azurerm_network_security_group.weu-prod-identity-subnet-nsg[count.index].id
  depends_on                = [azurerm_network_security_group.weu-prod-identity-subnet-nsg]
  lifecycle {
    ignore_changes = [
      network_security_group_id,
      subnet_id,
    ]
  }
}

resource "azurerm_subnet_network_security_group_association" "weu-dev-identity-subnet-nsg" {
  count                     = length(local.weu-dev-identity-subnet_name)
  provider                  = azurerm.weu-identity-sub
  subnet_id                 = azurerm_subnet.corp-weu-dev-identity-subnet[count.index].id
  network_security_group_id = azurerm_network_security_group.weu-dev-identity-subnet-nsg[count.index].id
  depends_on                = [azurerm_network_security_group.weu-dev-identity-subnet-nsg]
  lifecycle {
    ignore_changes = [
      network_security_group_id,
      subnet_id,
    ]
  }
}


//weu


resource "azurerm_subnet_network_security_group_association" "weu-prod-tis-nsg" {
  provider                  = azurerm.weu-prod-tis-sub
  count                     = length(local.weu-prod-tis-subnet-name)
  subnet_id                 = azurerm_subnet.corp-weu-prod-tis-subnet[count.index].id
  network_security_group_id = azurerm_network_security_group.weu-prod-tis-nsg[count.index].id
  depends_on                = [azurerm_network_security_group.weu-prod-tis-nsg]
  lifecycle {
    ignore_changes = [
      network_security_group_id,
      subnet_id,
    ]
  }
}

resource "azurerm_subnet_network_security_group_association" "weu-prod-tas-nsg" {
  provider                  = azurerm.weu-prod-tas-sub
  count                     = length(local.weu-prod-tas-subnet-name)
  subnet_id                 = azurerm_subnet.corp-weu-prod-tas-subnet[count.index].id
  network_security_group_id = azurerm_network_security_group.weu-prod-tas-nsg[count.index].id
  depends_on                = [azurerm_network_security_group.weu-prod-tas-nsg]
  lifecycle {
    ignore_changes = [
      network_security_group_id,
      subnet_id,
    ]
  }
}



resource "azurerm_subnet_network_security_group_association" "weu-dev-tis-nsg" {
  provider                  = azurerm.weu-dev-tis-sub
  count                     = length(local.weu-dev-tis-subnet-name)
  subnet_id                 = azurerm_subnet.corp-weu-dev-tis-subnet[count.index].id
  network_security_group_id = azurerm_network_security_group.weu-dev-tis-nsg[count.index].id
  depends_on                = [azurerm_network_security_group.weu-dev-tis-nsg]
  lifecycle {
    ignore_changes = [
      network_security_group_id,
      subnet_id,
    ]
  }
}

resource "azurerm_subnet_network_security_group_association" "weu-dev-tas-nsg" {
  provider                  = azurerm.weu-dev-tas-sub
  count                     = length(local.weu-dev-tas-subnet-name)
  subnet_id                 = azurerm_subnet.corp-weu-dev-tas-subnet[count.index].id
  network_security_group_id = azurerm_network_security_group.weu-dev-tas-nsg[count.index].id
  depends_on                = [azurerm_network_security_group.weu-dev-tas-nsg]
  lifecycle {
    ignore_changes = [
      network_security_group_id,
      subnet_id,
    ]
  }
}


resource "azurerm_subnet_network_security_group_association" "weu-uat-tis-nsg" {
  provider                  = azurerm.weu-uat-tis-sub
  count                     = length(local.weu-uat-tis-subnet-name)
  subnet_id                 = azurerm_subnet.corp-weu-uat-tis-subnet[count.index].id
  network_security_group_id = azurerm_network_security_group.weu-uat-tis-nsg[count.index].id
  depends_on                = [azurerm_network_security_group.weu-uat-tis-nsg]
  lifecycle {
    ignore_changes = [
      network_security_group_id,
      subnet_id,
    ]
  }
}


resource "azurerm_subnet_network_security_group_association" "weu-uat-tas-nsg" {
  provider                  = azurerm.weu-uat-tas-sub
  count                     = length(local.weu-uat-tas-subnet-name)
  subnet_id                 = azurerm_subnet.corp-weu-uat-tas-subnet[count.index].id
  network_security_group_id = azurerm_network_security_group.weu-uat-tas-nsg[count.index].id
  depends_on                = [azurerm_network_security_group.weu-uat-tas-nsg]
  lifecycle {
    ignore_changes = [
      network_security_group_id,
      subnet_id,
    ]
  }
}

