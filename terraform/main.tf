locals {
  name_prefix = "${var.project_name}-${var.environment}"
}

# Resource group
resource "azurerm_resource_group" "rg" {
  name     = "${local.name_prefix}-rg"
  location = var.location
}

# Container group (Azure Container Instances)
resource "azurerm_container_group" "app" {
  name                = "${local.name_prefix}-cg"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Linux"

  ip_address_type = "Public"
  dns_name_label  = "${local.name_prefix}-dns"
  restart_policy  = "Always"

  container {
    name   = "${local.name_prefix}-container"
    image  = var.container_image
    cpu    = "0.5"
    memory = "1.0"

    ports {
      port     = var.container_port
      protocol = "TCP"
    }
  }

  tags = {
    project     = var.project_name
    environment = var.environment
  }
}