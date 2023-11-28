locals {
  tags = join(" ", formatlist("%s=\"%s\"", keys(var.tags), values(var.tags)))
}

data "azurerm_client_config" "current" {}

resource "null_resource" "tags" {

  count = var.nb_resources

  triggers = {
    resource    = var.resource_ids[count.index]
    tags        = jsonencode(var.tags)
    force-apply = var.force ? uuid() : false
    behavior    = var.behavior
  }


}
