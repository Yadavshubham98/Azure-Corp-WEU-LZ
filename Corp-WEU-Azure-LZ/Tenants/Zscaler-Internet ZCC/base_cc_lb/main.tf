
locals {
  vm_tags = {
    ApplicationSupport  = "GenpactProxySupport@genpact.com"
    BusinessVertical    = "CorpIT"
    CCCode              = "180"
    Department          = "shared"
    Owner               = "keshav.rajput@genpact.com"
    OwnerSupervisor     = "gaurav.demiwal@genpact.com"
    PID                 = "shared"
    ProjectName         = "CORP Europe Azure Landing Zone"
    ProvisionedBy       = "Terraform"
    ProvisioningSR      = "CHG0082390"
    SDOCode             = "8561"
    Stack               = "Prod"
    supportcost         = "$"
    Backup              = "No"
    Custom-AMI          = "TRUE"
    Exception           = "Yes"
    DeploymentType      = "NN"
    os-support          = "GenpactProxySupport@genpact.com"
    ServiceType         = "IAAS"
    Role                = "Zscaler Cloud Connector"
    InstanceSchedule    = "24*7"
    PatchGroup          = "4th Sat 10:00 AM IST"
    RI                  = "TBD"
    schedulefordeletion = "No"
  }

  rg_tags = {
    ApplicationSupport = "GenpactProxySupport@genpact.com"
    supportcost        = "$"
    BusinessVertical   = "CorpIT"
    ProvisionedBy      = "Terraform"
    ProjectName        = "CORP Europe Azure Landing Zone"
    PID                = "shared"
    SDOCode            = "8561"
    OwnerSupervisor    = "gaurav.demiwal@genpact.com"
    Stack              = "Prod"
    ProvisioningSR     = "CHG0082390"
    CCCode             = "180"
    Owner              = "keshav.rajput@genpact.com"
    Department         = "shared"
  }
}

resource "tls_private_key" "key" {
  algorithm = var.tls_key_algorithm
}

# save the private key
resource "null_resource" "save-key" {
  triggers = {
    key = tls_private_key.key.private_key_pem
  }

  provisioner "local-exec" {
    command = <<EOF
      echo "${tls_private_key.key.private_key_pem}" > ${var.name_prefix}-key.pem
      chmod 0600 ${var.name_prefix}-key.pem
EOF
  }
}

###########################################################################################################################
###########################################################################################################################

## Create the user_data file

locals {
  userdata = <<USERDATA
[ZSCALER]
CC_URL=${var.cc_vm_prov_url}
AZURE_VAULT_URL=${var.azure_vault_url}
HTTP_PROBE_PORT=${var.http_probe_port}
USERDATA
}

resource "local_file" "user-data-file" {
  content  = local.userdata
  filename = "user_data"
}

resource "local_file" "ssh-key" {
  content  = tls_private_key.key.private_key_pem
  filename = "ssh-key.pem"
}



data "azurerm_resource_group" "main" {
  name = "corp-rg-weu-prod-shared-connectivity-zcc-01"
}


# Create Public IPs for NAT Gateways
resource "azurerm_public_ip" "nat-pip" {
  count                   = var.zones_enabled == true ? length(distinct(var.zones)) : 1
  name                    = "corp-pip-weu-prod-zcc-0${count.index + 1}"
  location                = var.arm_location
  resource_group_name     = data.azurerm_resource_group.main.name
  allocation_method       = "Static"
  sku                     = "Standard"
  idle_timeout_in_minutes = 30
  zones                   = local.zones_supported ? [element(var.zones, count.index)] : null

  tags = local.rg_tags
}


# Create NAT Gateways
resource "azurerm_nat_gateway" "nat-gw" {
  count                   = var.zones_enabled == true ? length(distinct(var.zones)) : 1
  name                    = "corp-nat-weu-prod-zcc-0${count.index + 1}"
  location                = var.arm_location
  resource_group_name     = data.azurerm_resource_group.main.name
  idle_timeout_in_minutes = 10
  zones                   = local.zones_supported ? [element(var.zones, count.index)] : null

  tags = local.rg_tags
}


## Associate Public IP to NAT Gateway

resource "azurerm_nat_gateway_public_ip_association" "nat-gw-association1" {
  count                = length(azurerm_nat_gateway.nat-gw.*.id)
  nat_gateway_id       = azurerm_nat_gateway.nat-gw.*.id[count.index]
  public_ip_address_id = azurerm_public_ip.nat-pip.*.id[count.index]

  depends_on = [
    azurerm_public_ip.nat-pip,
    azurerm_nat_gateway.nat-gw
  ]
}


data "azurerm_virtual_network" "vnet" {
  name                = "corp-weu-shared-internet"
  resource_group_name = "corp-rg-weu-prod-shared-connectivity-zcc-network"
}

resource "azurerm_subnet" "cc-subnet" {
  count                = var.zones_enabled == true ? length(distinct(var.zones)) : 1
  name                 = "corp-snet-weu-shared-zcc-app-0${count.index + 1}"
  resource_group_name  = data.azurerm_virtual_network.vnet.resource_group_name
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  address_prefixes     = var.cc_subnets != null ? [element(var.cc_subnets, count.index)] : [cidrsubnet(var.network_address_space, 8, count.index + 200)]
}



# # Associate Cloud Connector Subnet to NAT Gateway

module "cc-vm" {
  cc_count                              = var.cc_count
  source                                = "../modules/terraform-zscc-azure"
  global_tags                           = local.vm_tags
  resource_group                        = data.azurerm_resource_group.main.name
  mgmt_subnet_id                        = azurerm_subnet.cc-subnet.*.id
  service_subnet_id                     = azurerm_subnet.cc-subnet.*.id
  ssh_key                               = tls_private_key.key.public_key_openssh
  cc_vm_managed_identity_name           = var.cc_vm_managed_identity_name
  cc_vm_managed_identity_resource_group = var.cc_vm_managed_identity_resource_group
  user_data                             = local.userdata
  backend_address_pool                  = module.cc-lb.lb_backend_address_pool
  lb_association_enabled                = true
  location                              = var.arm_location
  zones_enabled                         = var.zones_enabled
  zones                                 = var.zones
  ccvm_instance_type                    = var.ccvm_instance_type
  ccvm_image_publisher                  = var.ccvm_image_publisher
  ccvm_image_offer                      = var.ccvm_image_offer
  ccvm_image_sku                        = var.ccvm_image_sku
  ccvm_image_version                    = var.ccvm_image_version

  # depends_on = [
  #   # azurerm_subnet_nat_gateway_association.subnet-nat-association-ec,
  #   local_file.user-data-file,
  # ]
}

# Azure Load Balancer Module variables
module "cc-lb" {
  source            = "../modules/terraform-zslb-azure"
  global_tags       = local.rg_tags
  resource_group    = data.azurerm_resource_group.main.name
  location          = var.arm_location
  subnet_id         = azurerm_subnet.cc-subnet.*.id
  http_probe_port   = var.http_probe_port
  load_distribution = "SourceIP"
  zones             = var.zones
}
