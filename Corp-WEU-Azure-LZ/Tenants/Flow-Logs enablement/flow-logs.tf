data "azurerm_network_watcher" "nwatcherconnectivity" {
  provider            = azurerm.weu-connectivity-sub
  name                = "NetworkWatcher_westeurope"
  resource_group_name = "NetworkWatcherRG"
}


data "azurerm_network_watcher" "nwatcheridentity" {
  provider            = azurerm.weu-identity-sub
  name                = "NetworkWatcher_westeurope"
  resource_group_name = "NetworkWatcherRG"
}


data "azurerm_network_watcher" "nwatchermanagement" {
  provider            = azurerm.weu-management-sub
  name                = "NetworkWatcher_westeurope"
  resource_group_name = "NetworkWatcherRG"
}


data "azurerm_storage_account" "corpstorweupsecflowlog" {
  provider            = azurerm.weu-security-sub
  name                = "corpstorweupsecflowlog"
  resource_group_name = "corp-rg-weu-prod-shared-flowlog-storage"
}

data "azurerm_storage_account" "corpstorweudsecflowlog" {
  provider            = azurerm.weu-security-sub
  name                = "corpstorweudsecflowlog"
  resource_group_name = "corp-rg-weu-dev-shared-flowlog-storage"
}

data "azurerm_resources" "nsginternetzcc" {
  provider            = azurerm.weu-connectivity-sub
  type                = "Microsoft.Network/networkSecurityGroups"
  resource_group_name = "corp-rg-weu-prod-shared-connectivity-zcc-01"
  required_tags = {
    "ProvisioningSR" = "CHG0082390"
  }
}

data "azurerm_log_analytics_workspace" "corp-la-weu-workspace" {
  provider            = azurerm.weu-security-sub
  name                = "corp-la-weu-workspace"
  resource_group_name = "corp-rg-weu-prod-shared-security-analytics-log"
}


resource "azurerm_network_watcher_flow_log" "corp-snet-weu-prod-shared-internet-NSG-flowlog" {
  for_each                  = { for n in data.azurerm_resources.nsginternetzcc.resources : n.name => n }
  provider                  = azurerm.weu-connectivity-sub
  network_watcher_name      = data.azurerm_network_watcher.nwatcherconnectivity.name
  resource_group_name       = data.azurerm_network_watcher.nwatcherconnectivity.resource_group_name
  name                      = "${each.key}-nsg-flowlog"
  network_security_group_id = each.value.id
  storage_account_id        = data.azurerm_storage_account.corpstorweupsecflowlog.id
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

}


data "azurerm_resources" "ADServerNSG" {
  provider            = azurerm.weu-identity-sub
  type                = "Microsoft.Network/networkSecurityGroups"
  resource_group_name = "corp-rg-weu-prod-shared-identity-core-adc"
  required_tags = {
    "ProvisioningSR" = "CHG0082390"
  }
}

resource "azurerm_network_watcher_flow_log" "ADservers-NSG-flowlog" {
  for_each                  = { for n in data.azurerm_resources.ADServerNSG.resources : n.name => n }
  provider                  = azurerm.weu-identity-sub
  network_watcher_name      = data.azurerm_network_watcher.nwatcheridentity.name
  resource_group_name       = data.azurerm_network_watcher.nwatcheridentity.resource_group_name
  name                      = "${each.key}-nsg-flowlog"
  network_security_group_id = each.value.id
  storage_account_id        = data.azurerm_storage_account.corpstorweupsecflowlog.id
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
}

data "azurerm_resources" "DevADServerNSG" {
  provider            = azurerm.weu-identity-sub
  type                = "Microsoft.Network/networkSecurityGroups"
  resource_group_name = "corp-rg-weu-dev-shared-identity-core-adc"
  required_tags = {
    "ProvisioningSR" = "CHG0082390"
  }
}

resource "azurerm_network_watcher_flow_log" "DevADservers-NSG-flowlog" {
  for_each                  = { for n in data.azurerm_resources.DevADServerNSG.resources : n.name => n }
  provider                  = azurerm.weu-identity-sub
  network_watcher_name      = data.azurerm_network_watcher.nwatcheridentity.name
  resource_group_name       = data.azurerm_network_watcher.nwatcheridentity.resource_group_name
  name                      = "${each.key}-nsg-flowlog"
  network_security_group_id = each.value.id
  storage_account_id        = data.azurerm_storage_account.corpstorweudsecflowlog.id
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
  tags = local.security_subscription_tags[local.security-subscription-rg[2]]
}


data "azurerm_resources" "OktaServerNSG" {
  provider            = azurerm.weu-identity-sub
  type                = "Microsoft.Network/networkSecurityGroups"
  resource_group_name = "corp-rg-weu-prod-shared-identity-core-okta"
  required_tags = {
    "ProvisioningSR" = "CHG0082390"
  }
}


resource "azurerm_network_watcher_flow_log" "OktaServersNSGFlowlogs" {
  for_each                  = { for n in data.azurerm_resources.OktaServerNSG.resources : n.name => n }
  provider                  = azurerm.weu-identity-sub
  network_watcher_name      = data.azurerm_network_watcher.nwatcheridentity.name
  resource_group_name       = data.azurerm_network_watcher.nwatcheridentity.resource_group_name
  name                      = "${each.key}-nsg-flowlog"
  network_security_group_id = each.value.id
  storage_account_id        = data.azurerm_storage_account.corpstorweupsecflowlog.id
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
}

data "azurerm_resources" "DevOktaServerNSG" {
  provider            = azurerm.weu-identity-sub
  type                = "Microsoft.Network/networkSecurityGroups"
  resource_group_name = "corp-rg-weu-dev-shared-identity-core-okta"
  required_tags = {
    "ProvisioningSR" = "CHG0082390"
  }
}

resource "azurerm_network_watcher_flow_log" "DevOktaServersNSGFlowlogs" {
  for_each                  = { for n in data.azurerm_resources.DevOktaServerNSG.resources : n.name => n }
  provider                  = azurerm.weu-identity-sub
  network_watcher_name      = data.azurerm_network_watcher.nwatcheridentity.name
  resource_group_name       = data.azurerm_network_watcher.nwatcheridentity.resource_group_name
  name                      = "${each.key}-nsg-flowlog"
  network_security_group_id = each.value.id
  storage_account_id        = data.azurerm_storage_account.corpstorweudsecflowlog.id
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
  tags = local.security_subscription_tags[local.security-subscription-rg[2]]
}


data "azurerm_resources" "LMServerNSG" {
  provider            = azurerm.weu-management-sub
  type                = "Microsoft.Network/networkSecurityGroups"
  resource_group_name = "corp-rg-weu-prod-shared-management-core-lmc"
  required_tags = {
    "ProvisioningSR" = "CHG0082390"
  }
}


resource "azurerm_network_watcher_flow_log" "LMServersNSGFlowlogs" {
  for_each                  = { for n in data.azurerm_resources.LMServerNSG.resources : n.name => n }
  provider                  = azurerm.weu-management-sub
  network_watcher_name      = data.azurerm_network_watcher.nwatchermanagement.name
  resource_group_name       = data.azurerm_network_watcher.nwatchermanagement.resource_group_name
  name                      = "${each.key}-nsg-flowlog"
  network_security_group_id = each.value.id
  storage_account_id        = data.azurerm_storage_account.corpstorweupsecflowlog.id
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
}


data "azurerm_resources" "DevLMServerNSG" {
  provider            = azurerm.weu-management-sub
  type                = "Microsoft.Network/networkSecurityGroups"
  resource_group_name = "corp-rg-weu-dev-shared-management-core-lmc"
  required_tags = {
    "ProvisioningSR" = "CHG0082390"
  }
}

resource "azurerm_network_watcher_flow_log" "DevLMServersNSGFlowlogs" {
  for_each                  = { for n in data.azurerm_resources.DevLMServerNSG.resources : n.name => n }
  provider                  = azurerm.weu-management-sub
  network_watcher_name      = data.azurerm_network_watcher.nwatchermanagement.name
  resource_group_name       = data.azurerm_network_watcher.nwatchermanagement.resource_group_name
  name                      = "${each.key}-nsg-flowlog"
  network_security_group_id = each.value.id
  storage_account_id        = data.azurerm_storage_account.corpstorweudsecflowlog.id
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
  tags = local.security_subscription_tags[local.security-subscription-rg[2]]
}



data "azurerm_resources" "prodjumpServerNSG" {
  provider            = azurerm.weu-management-sub
  type                = "Microsoft.Network/networkSecurityGroups"
  resource_group_name = "corp-rg-weu-prod-shared-management-core-jmp"
  required_tags = {
    "ProvisioningSR" = "CHG0082390"
  }
}

resource "azurerm_network_watcher_flow_log" "prodjumpServersNSGFlowlogs" {
  for_each                  = { for n in data.azurerm_resources.prodjumpServerNSG.resources : n.name => n }
  provider                  = azurerm.weu-management-sub
  network_watcher_name      = data.azurerm_network_watcher.nwatchermanagement.name
  resource_group_name       = data.azurerm_network_watcher.nwatchermanagement.resource_group_name
  name                      = "${each.key}-nsg-flowlog"
  network_security_group_id = each.value.id
  storage_account_id        = data.azurerm_storage_account.corpstorweupsecflowlog.id
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
}


data "azurerm_resources" "devjumpServerNSG" {
  provider            = azurerm.weu-management-sub
  type                = "Microsoft.Network/networkSecurityGroups"
  resource_group_name = "corp-rg-weu-dev-shared-management-core-jmp"
  required_tags = {
    "ProvisioningSR" = "CHG0082390"
  }
}


resource "azurerm_network_watcher_flow_log" "devjumpServersNSGFlowlogs" {
  for_each                  = { for n in data.azurerm_resources.devjumpServerNSG.resources : n.name => n }
  provider                  = azurerm.weu-management-sub
  network_watcher_name      = data.azurerm_network_watcher.nwatchermanagement.name
  resource_group_name       = data.azurerm_network_watcher.nwatchermanagement.resource_group_name
  name                      = "${each.key}-nsg-flowlog"
  network_security_group_id = each.value.id
  storage_account_id        = data.azurerm_storage_account.corpstorweudsecflowlog.id
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
  tags = local.security_subscription_tags[local.security-subscription-rg[2]]
}
