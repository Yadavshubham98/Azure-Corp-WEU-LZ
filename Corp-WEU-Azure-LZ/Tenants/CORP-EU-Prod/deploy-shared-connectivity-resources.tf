

# resource "azurerm_private_dns_zone" "example" {
#   count               = length(local.dns_zones)
#   name                = local.dns_zones[count.index]
#   resource_group_name = azurerm_resource_group.corp-rg-weu-shared-connectivity-core-network.name
#   tags                = local.prod_shared_network_tags
# }


resource "azurerm_private_dns_zone" "weu-prod-pdz" {
  provider            = azurerm.weu-identity-sub
  count               = length(local.dns_zones)
  name                = local.dns_zones[count.index]
  resource_group_name = azurerm_resource_group.weu-private-dns-zone-rgs[0].name
  tags                = local.private_dns_zone_tags[local.private-dns-zone-rg[0]]
}

resource "azurerm_private_dns_zone_virtual_network_link" "weu-prod-pdz-link" {
  provider              = azurerm.weu-identity-sub
  count                 = length(local.dns_zones)
  name                  = "${local.dns_zones[count.index]}-AD-link"
  resource_group_name   = azurerm_resource_group.weu-private-dns-zone-rgs[0].name
  private_dns_zone_name = azurerm_private_dns_zone.weu-prod-pdz[count.index].name
  virtual_network_id    = azurerm_virtual_network.corp-weu-prod-shared-identity.id
  lifecycle {
    ignore_changes = [
      tags,
      private_dns_zone_name,
    ]
  }
}

resource "azurerm_private_dns_zone" "weu-dev-pdz" {
  provider            = azurerm.weu-identity-sub
  count               = length(local.dns_zones)
  name                = local.dns_zones[count.index]
  resource_group_name = azurerm_resource_group.weu-private-dns-zone-rgs[1].name
  tags                = local.private_dns_zone_tags[local.private-dns-zone-rg[1]]
}

resource "azurerm_private_dns_zone_virtual_network_link" "weu-dev-pdz-link" {
  provider              = azurerm.weu-identity-sub
  count                 = length(local.dns_zones)
  name                  = "${local.dns_zones[count.index]}-AD-link"
  resource_group_name   = azurerm_resource_group.weu-private-dns-zone-rgs[1].name
  private_dns_zone_name = azurerm_private_dns_zone.weu-dev-pdz[count.index].name
  virtual_network_id    = azurerm_virtual_network.corp-weu-dev-shared-identity.id
  lifecycle {
    ignore_changes = [
      tags,
      private_dns_zone_name,
    ]
  }
}

