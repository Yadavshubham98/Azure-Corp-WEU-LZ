#-----------------------------------------------------------------------------------------------------------------
# Create internal load balancer. Load balancer uses cloud connector service interfaces as its backend pool
# and configured HTTP Probe Port for health checking

# Create Standard Load Balancer
resource "azurerm_lb" "cc-lb" {
  name                       = "corp-lb-weu-prod-zcc-01"
  location                     = var.location
  resource_group_name          = var.resource_group
  sku                          = "Standard"

  tags = var.global_tags

#   lifecycle {
#     ignore_changes = [
#       tags,
#     ]
# }
  
  
  frontend_ip_configuration {
    name                          = "corp-lb-weu-prod-zcc-01-ipconfig"
    subnet_id                     = var.subnet_id[0]
    private_ip_address_allocation = "Static"
    private_ip_address_version = "IPv4"
    private_ip_address = "10.251.90.6"
  }
}


# Create backend address pool for load balancer
resource "azurerm_lb_backend_address_pool" "cc-lb-backend-pool" {
  name                = "corp-lb-weu-prod-zcc-01-backend"
  resource_group_name = var.resource_group
  loadbalancer_id     = azurerm_lb.cc-lb.id
}


# Define load balancer health probe parameters
resource "azurerm_lb_probe" "cc-lb-probe" {
  name                = "corp-lb-weu-prod-zcc-01-health"
  resource_group_name = var.resource_group
  loadbalancer_id     = azurerm_lb.cc-lb.id
  protocol            = "Http"
  port                = var.http_probe_port 
  request_path        = "/?cchealth"
}


# Create load balancer rule
resource "azurerm_lb_rule" "cc-lb-rule" {
  name                           = "corp-lb-weu-prod-zcc-01-rule"
  resource_group_name            = var.resource_group
  loadbalancer_id                = azurerm_lb.cc-lb.id
  protocol                       = "All"
  frontend_port                  = 0
  backend_port                   = 0
  frontend_ip_configuration_name = azurerm_lb.cc-lb.frontend_ip_configuration[0].name
  backend_address_pool_id        = azurerm_lb_backend_address_pool.cc-lb-backend-pool.id
  probe_id                       = azurerm_lb_probe.cc-lb-probe.id
  load_distribution              = var.load_distribution
}