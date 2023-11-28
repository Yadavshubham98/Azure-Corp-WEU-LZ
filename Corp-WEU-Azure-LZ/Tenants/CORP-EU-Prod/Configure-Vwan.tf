data "azurerm_resource_group" "main" {
  name = "corp-rg-ind-prod-shared-connectivity-core-network"
}
data "azurerm_virtual_wan" "indwan" {
  name                = "corp-vwan-ind-shared"
  resource_group_name = "corp-rg-ind-prod-shared-connectivity-core-network"
}


//Provision regional VWAN Hubs
resource "azurerm_virtual_hub" "corp-weu-prod-hub" {
  provider            = azurerm.weu-connectivity-sub
  name                = "corp-vhub-weu-shared"
  resource_group_name = data.azurerm_resource_group.main.name
  location            = var.location-weu
  virtual_wan_id      = data.azurerm_virtual_wan.indwan.id
  address_prefix      = "10.251.88.0/23"
  tags                = local.prod_shared_network_tags
  lifecycle {
    ignore_changes = [
      virtual_wan_id,
    ]
  }
}


# //VHUB Connections - WEU HUB

resource "azurerm_virtual_hub_connection" "vhub-weu-prod-shared-management" {
  name                      = "corp-weu-prod-shared-management-connection"
  virtual_hub_id            = azurerm_virtual_hub.corp-weu-prod-hub.id
  remote_virtual_network_id = azurerm_virtual_network.corp-weu-prod-shared-management.id
  lifecycle {
    ignore_changes = [
      remote_virtual_network_id,
      internet_security_enabled,
    ]
  }
}



resource "azurerm_virtual_hub_connection" "vhub-weu-dev-shared-management" {
  name                      = "corp-weu-dev-shared-management-connection"
  virtual_hub_id            = azurerm_virtual_hub.corp-weu-prod-hub.id
  remote_virtual_network_id = azurerm_virtual_network.corp-weu-dev-shared-management.id
  lifecycle {
    ignore_changes = [
      remote_virtual_network_id,
      internet_security_enabled,
    ]
  }
}


resource "azurerm_virtual_hub_connection" "vhub-corp-weu-prod-shared-identity" {
  name                      = "corp-weu-prod-shared-identity-connection"
  virtual_hub_id            = azurerm_virtual_hub.corp-weu-prod-hub.id
  remote_virtual_network_id = azurerm_virtual_network.corp-weu-prod-shared-identity.id
  lifecycle {
    ignore_changes = [
      remote_virtual_network_id,
      internet_security_enabled,
    ]
  }
}


//Landing Zones
resource "azurerm_virtual_hub_connection" "vhub-corp-weu-prod-tas" {
  name                      = "corp-weu-prod-tas-connection"
  virtual_hub_id            = azurerm_virtual_hub.corp-weu-prod-hub.id
  remote_virtual_network_id = azurerm_virtual_network.corp-weu-prod-tas.id
  lifecycle {
    ignore_changes = [
      remote_virtual_network_id,
      internet_security_enabled,
    ]
  }
}
resource "azurerm_virtual_hub_connection" "vhub-corp-weu-prod-tis" {
  name                      = "corp-weu-prod-tis-connection"
  virtual_hub_id            = azurerm_virtual_hub.corp-weu-prod-hub.id
  remote_virtual_network_id = azurerm_virtual_network.corp-weu-prod-tis.id
  lifecycle {
    ignore_changes = [
      remote_virtual_network_id,
      internet_security_enabled,
    ]
  }
}
resource "azurerm_virtual_hub_connection" "vhub-corp-weu-dev-tis" {
  name                      = "corp-weu-dev-tis-connection"
  virtual_hub_id            = azurerm_virtual_hub.corp-weu-prod-hub.id
  remote_virtual_network_id = azurerm_virtual_network.corp-weu-dev-tis.id
  lifecycle {
    ignore_changes = [
      remote_virtual_network_id,
      internet_security_enabled,
    ]
  }
}
resource "azurerm_virtual_hub_connection" "vhub-corp-weu-dev-tas" {
  name                      = "corp-weu-dev-tas-connection"
  virtual_hub_id            = azurerm_virtual_hub.corp-weu-prod-hub.id
  remote_virtual_network_id = azurerm_virtual_network.corp-weu-dev-tas.id
  lifecycle {
    ignore_changes = [
      remote_virtual_network_id,
      internet_security_enabled,
    ]
  }
}
resource "azurerm_virtual_hub_connection" "vhub-corp-weu-uat-tis" {
  name                      = "corp-weu-uat-tis-connection"
  virtual_hub_id            = azurerm_virtual_hub.corp-weu-prod-hub.id
  remote_virtual_network_id = azurerm_virtual_network.corp-weu-uat-tis.id
  lifecycle {
    ignore_changes = [
      remote_virtual_network_id,
      internet_security_enabled,
    ]
  }
}
resource "azurerm_virtual_hub_connection" "vhub-corp-weu-uat-tas" {
  name                      = "corp-weu-uat-tas-connection"
  virtual_hub_id            = azurerm_virtual_hub.corp-weu-prod-hub.id
  remote_virtual_network_id = azurerm_virtual_network.corp-weu-uat-tas.id
  lifecycle {
    ignore_changes = [
      remote_virtual_network_id,
      internet_security_enabled,
    ]
  }
}



# resource "azurerm_virtual_hub_connection" "vhub-corp-weu-shared-security" {
#   name                      = "corp-weu-shared-security-connection"
#   virtual_hub_id            = azurerm_virtual_hub.corp-weu-prod-hub.id
#   remote_virtual_network_id = azurerm_virtual_network.corp-weu-shared-connectivity.id
#   lifecycle {
#     ignore_changes = [
#       remote_virtual_network_id,
#       internet_security_enabled,
#     ]
#   }
# }

resource "azurerm_virtual_hub_connection" "vhub-corp-weu-shared-internet" {
  name                      = "corp-weu-shared-internet-connection"
  virtual_hub_id            = azurerm_virtual_hub.corp-weu-prod-hub.id
  remote_virtual_network_id = azurerm_virtual_network.corp-weu-shared-internet.id
  lifecycle {
    ignore_changes = [
      remote_virtual_network_id,
      internet_security_enabled,
    ]
  }
}