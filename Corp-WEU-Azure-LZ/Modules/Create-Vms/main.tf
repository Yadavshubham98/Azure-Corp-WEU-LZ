


module "os" {
  source       = "./os"
  vm_os_simple = var.vm_os_simple
}

data "azurerm_resource_group" "vm" {
  name = var.resource_group_name
}

locals {
  ssh_keys = compact(concat([var.ssh_key], var.extra_ssh_keys))
}

resource "random_id" "vm-sa" {
  keepers = {
    vm_hostname = var.vm_hostname
  }

  byte_length = 6
}


locals {
   zones = ["1","2","3"]
}


resource "azurerm_virtual_machine" "vm-linux" {
  count                            = ! contains(tolist([var.vm_os_simple, var.vm_os_offer]), "WindowsServer") && ! var.is_windows_image ? var.nb_instances : 0
  name                             = "${var.vm_hostname}${format("%02d",count.index+1)}"
  resource_group_name              = data.azurerm_resource_group.vm.name
  location                         = coalesce(var.location, data.azurerm_resource_group.vm.location)
  //availability_set_id              = azurerm_availability_set.vm.id
  vm_size                          = var.vm_size
  network_interface_ids            = [element(azurerm_network_interface.vm.*.id, count.index)]
  delete_os_disk_on_termination    = var.delete_os_disk_on_termination
  delete_data_disks_on_termination = var.delete_data_disks_on_termination

  zones = [element(local.zones,count.index)]

  dynamic identity {
    for_each = length(var.identity_ids) == 0 && var.identity_type == "SystemAssigned" ? [var.identity_type] : []
    content {
      type = var.identity_type
    }
  }

  dynamic identity {
    for_each = length(var.identity_ids) > 0 || var.identity_type == "UserAssigned" ? [var.identity_type] : []
    content {
      type         = var.identity_type
      identity_ids = length(var.identity_ids) > 0 ? var.identity_ids : []
    }
  }

  storage_image_reference {
    id        = var.vm_os_id
    publisher = var.vm_os_id == "" ? coalesce(var.vm_os_publisher, module.os.calculated_value_os_publisher) : ""
    offer     = var.vm_os_id == "" ? coalesce(var.vm_os_offer, module.os.calculated_value_os_offer) : ""
    sku       = var.vm_os_id == "" ? coalesce(var.vm_os_sku, module.os.calculated_value_os_sku) : ""
    version   = var.vm_os_id == "" ? var.vm_os_version : ""
  }

  # storage_os_disk {
  #   name              = "${var.vm_hostname}-osdisk-${format("%02d",count.index+1)}"
  #   create_option     = "FromImage"
  #   caching           = "ReadWrite"
  #   managed_disk_type = var.storage_account_type
  # }
  storage_os_disk {
    name              = "${var.vm_hostname}-osdisk-${format("%02d",count.index+1)}"
    create_option     = "FromImage"
    caching           = "ReadWrite"
    managed_disk_type = var.data_sa_type
  }

  dynamic storage_data_disk {
    for_each = range(var.nb_data_disk)
    content {
      name              = "${var.vm_hostname}-datadisk-${format("%02d",count.index+1)}"
      create_option     = "Empty"
      lun               = storage_data_disk.value
      disk_size_gb      = var.data_disk_size_gb
      managed_disk_type = var.data_sa_type
    }
  }

  dynamic storage_data_disk {
    for_each = var.extra_disks
    content {
      name              = "${var.vm_hostname}-extradisk-${count.index+1}-${storage_data_disk.value.name}"
      create_option     = "Empty"
      lun               = storage_data_disk.key + var.nb_data_disk
      disk_size_gb      = storage_data_disk.value.size
      managed_disk_type = var.data_sa_type
    }
  }

  os_profile {
    computer_name  = "${var.vm_hostname}${format("%02d",count.index+1)}"
    admin_username = var.admin_username
    admin_password = var.admin_password
    custom_data    = var.custom_data
  }

  os_profile_linux_config {
    disable_password_authentication = var.enable_ssh_key

    dynamic ssh_keys {
      for_each = var.enable_ssh_key ? local.ssh_keys : []
      content {
        path     = "/home/${var.admin_username}/.ssh/authorized_keys"
        key_data = file(ssh_keys.value)
      }
    }

    dynamic ssh_keys {
      for_each = var.enable_ssh_key ? var.ssh_key_values : []
      content {
        path     = "/home/${var.admin_username}/.ssh/authorized_keys"
        key_data = ssh_keys.value
      }
    }

  }

  dynamic "os_profile_secrets" {
    for_each = var.os_profile_secrets
    content {
      source_vault_id = os_profile_secrets.value["source_vault_id"]

      vault_certificates {
        certificate_url = os_profile_secrets.value["certificate_url"]
      }
    }
  }

  tags = var.tags

  boot_diagnostics {
    enabled     = var.boot_diagnostics
    storage_uri = var.boot_diagnostics ? "https://${var.diagnostic_sa}.blob.core.windows.net" : ""
  }
  lifecycle {
    ignore_changes = [
      network_interface_ids,  # Prevent changes to the network_interface_ids attribute.
	  tags,
    ]
  }
}

resource "azurerm_virtual_machine" "vm-windows" {
  count                         = (var.is_windows_image || contains(tolist([var.vm_os_simple, var.vm_os_offer]), "WindowsServer")) ? var.nb_instances : 0
  name                          = "${var.vm_hostname}${format("%02d",count.index+1)}"
  resource_group_name           = data.azurerm_resource_group.vm.name
  location                      = coalesce(var.location, data.azurerm_resource_group.vm.location)
 // availability_set_id           = azurerm_availability_set.vm.id
  vm_size                       = var.vm_size
  network_interface_ids         = [element(azurerm_network_interface.vm.*.id, count.index)]
  delete_os_disk_on_termination = var.delete_os_disk_on_termination
  license_type                  = var.license_type
zones = [element(local.zones,count.index)]
  dynamic identity {
    for_each = length(var.identity_ids) == 0 && var.identity_type == "SystemAssigned" ? [var.identity_type] : []
    content {
      type = var.identity_type
    }
  }

  dynamic identity {
    for_each = length(var.identity_ids) > 0 || var.identity_type == "UserAssigned" ? [var.identity_type] : []
    content {
      type         = var.identity_type
      identity_ids = length(var.identity_ids) > 0 ? var.identity_ids : []
    }
  }

  storage_image_reference {
    id        = var.vm_os_id
    publisher = var.vm_os_id == "" ? coalesce(var.vm_os_publisher, module.os.calculated_value_os_publisher) : ""
    offer     = var.vm_os_id == "" ? coalesce(var.vm_os_offer, module.os.calculated_value_os_offer) : ""
    sku       = var.vm_os_id == "" ? coalesce(var.vm_os_sku, module.os.calculated_value_os_sku) : ""
    version   = var.vm_os_id == "" ? var.vm_os_version : ""
  }

  # storage_os_disk {
  #   name              = "${var.vm_hostname}${format("%02d",count.index+1)}-osdisk"
  #   create_option     = "FromImage"
  #   caching           = "ReadWrite"
  #   managed_disk_type = var.storage_account_type
  # }
  storage_os_disk {
    name              = "${var.vm_hostname}${format("%02d",count.index+1)}-osdisk"
    create_option     = "FromImage"
    caching           = "ReadWrite"
    managed_disk_type = var.data_sa_type
  }

  dynamic storage_data_disk {
    for_each = range(var.nb_data_disk)
    content {
      name              = "${var.vm_hostname}${format("%02d",count.index+1)}-datadisk-${count.index+1}"
      create_option     = "Empty"
      lun               = storage_data_disk.value
      disk_size_gb      = var.data_disk_size_gb
      managed_disk_type = var.data_sa_type
    }
  }

  dynamic storage_data_disk {
    for_each = var.extra_disks
    content {
      name              = "${var.vm_hostname}${format("%02d",count.index+1)}-extradisk-${count.index+1}"
      create_option     = "Empty"
      lun               = storage_data_disk.key + var.nb_data_disk
      disk_size_gb      = storage_data_disk.value.size
      managed_disk_type = var.data_sa_type
    }
  }

  os_profile {
    computer_name  = "${var.vm_hostname}${format("%02d",count.index+1)}"
    admin_username = var.admin_username
    admin_password = var.admin_password
  }

  tags = var.tags

  os_profile_windows_config {
    provision_vm_agent = true
  }

  dynamic "os_profile_secrets" {
    for_each = var.os_profile_secrets
    content {
      source_vault_id = os_profile_secrets.value["source_vault_id"]

      vault_certificates {
        certificate_url   = os_profile_secrets.value["certificate_url"]
        certificate_store = os_profile_secrets.value["certificate_store"]
      }
    }
  }

  boot_diagnostics {
    enabled     = var.boot_diagnostics
    storage_uri = var.boot_diagnostics ? "https://${var.diagnostic_sa}.blob.core.windows.net" : ""
  }
  lifecycle {
    ignore_changes = [
      network_interface_ids,  # Prevent changes to the network_interface_ids attribute.
	  tags,
    ]
  }
}

/* resource "azurerm_availability_set" "vm" {
  name                         = "${var.vm_hostname}-avset"
  resource_group_name          = data.azurerm_resource_group.vm.name
  location                     = coalesce(var.location, data.azurerm_resource_group.vm.location)
  platform_fault_domain_count  = 2
  platform_update_domain_count = 2
  managed                      = true
  tags                         = var.tags
} */

resource "azurerm_public_ip" "vm" {
  zones = [element(local.zones,count.index)]
  count               = var.nb_public_ip
  name                = "${var.vm_hostname}${format("%02d",count.index+1)}-pip${format("%02d",count.index+1)}"
  resource_group_name = data.azurerm_resource_group.vm.name
  location            = coalesce(var.location, data.azurerm_resource_group.vm.location)
  allocation_method   = var.allocation_method
  sku                 = var.public_ip_sku
  domain_name_label   = element(var.public_ip_dns, count.index)
  tags                = var.tags
}

// Dynamic public ip address will be got after it's assigned to a vm
data "azurerm_public_ip" "vm" {
  count               = var.nb_public_ip
  name                = azurerm_public_ip.vm[count.index].name
  resource_group_name = data.azurerm_resource_group.vm.name
  depends_on          = [azurerm_virtual_machine.vm-linux, azurerm_virtual_machine.vm-windows]
}

 resource "azurerm_network_security_group" "vm" {
   count                         = var.nb_instances
  name                = "${var.vm_hostname}${format("%02d",count.index+1)}-nsg"
  resource_group_name = data.azurerm_resource_group.vm.name
  location            = coalesce(var.location, data.azurerm_resource_group.vm.location)
  tags = var.tags
  lifecycle {
    ignore_changes = [
	  tags,
    ]
  }
}
resource "azurerm_network_security_rule" "vm" {
  count                     = var.nb_instances
  name                        = "Deny_All_Inbound"
  resource_group_name         = data.azurerm_resource_group.vm.name
  description                 = "Deny_All_Inbound"
  priority                    = 4096
  direction                   = "Inbound"
  access                      = "Deny"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix     = "*"
  destination_address_prefix  = "*"
  network_security_group_name = azurerm_network_security_group.vm[count.index].name
}

resource "azurerm_network_interface" "vm" {
  count                         = var.nb_instances
  name                          = "${var.vm_hostname}${format("%02d",count.index+1)}-nic-01"
  resource_group_name           = data.azurerm_resource_group.vm.name
  location                      = coalesce(var.location, data.azurerm_resource_group.vm.location)
  enable_accelerated_networking = var.enable_accelerated_networking

  ip_configuration {
    name                          = "${var.vm_hostname}${format("%02d",count.index+1)}-ip-${count.index+1}"
    subnet_id                     = var.vnet_subnet_id
    private_ip_address_allocation = "Dynamic"

    public_ip_address_id          = length(azurerm_public_ip.vm.*.id) > 0 ? element(concat(azurerm_public_ip.vm.*.id, tolist([""])), count.index): ""
  }
  # network_security_group_id = azurerm_network_security_group.vm[count.index].id
  tags = var.tags
  lifecycle {
    ignore_changes = [
      ip_configuration[0].private_ip_address_allocation,
	  tags,
    ]
  }
}



resource "azurerm_network_interface_security_group_association" "test" {
  count                     = var.nb_instances
  network_interface_id      = azurerm_network_interface.vm[count.index].id
  network_security_group_id = azurerm_network_security_group.vm[count.index].id
  lifecycle {
    ignore_changes = [
      network_interface_id,
      network_security_group_id,
      // Add more attributes as needed
    ]
  }
}
